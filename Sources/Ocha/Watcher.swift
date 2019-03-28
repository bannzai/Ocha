//
//  Entrypoint.swift
//  Ocha
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public class Watcher {
    private var pointer: UnsafeMutableRawPointer {
        return UnsafeMutableRawPointer(mutating: Unmanaged.passUnretained(self).toOpaque())
    }
    private lazy var context = FSEventStreamContext(version: 0, info: pointer, retain: nil, release: nil, copyDescription: nil)
    private lazy var stream: FSEventStreamRef = {
        let stream = FSEventStreamCreate(
            kCFAllocatorDefault,
            _callback,
            &context,
            paths as CFArray,
            FSEventStreamEventId(kFSEventStreamEventIdSinceNow),
            0,
            UInt32(kFSEventStreamCreateFlagUseCFTypes | kFSEventStreamCreateFlagFileEvents)
            )!
        return stream
    }()
    
    deinit {
        stop()
        release()
    }

    private var _callback: FSEventStreamCallback = { (stream, contextInfo, numEvents, eventPaths, eventFlags, eventIds) in
        let watcher = unsafeBitCast(contextInfo, to: Watcher.self)
        guard let paths = unsafeBitCast(eventPaths, to: NSArray.self) as? [String] else {
            assertionFailure()
            return
        }
        if numEvents > 0 {
            var fileEvents: [FileEvent] = (0..<numEvents)
                .map { i in FileEvent(id: eventIds[i], flag: Int(eventFlags[i]), path: paths[i]) }
                .filter { !watcher.ignoredDotPrefix || $0.path.components(separatedBy: "/").contains { $0.hasPrefix(".") } }
            fileEvents.forEach { print("$0: \($0)") }
            watcher.callback?(fileEvents)
        }
    }
    
    private let paths: [String]
    private let ignoredDotPrefix: Bool
    public init(paths: [WatchingPathable], ignoredDotPrefix: Bool = true) {
        self.paths = paths.map { $0.watchingPath() }
        self.ignoredDotPrefix = ignoredDotPrefix
    }
    
    public typealias CallBack = ([FileEvent]) -> Void
    private var callback: CallBack?
    public func start(_ callback: @escaping CallBack) {
        self.callback = callback
        FSEventStreamScheduleWithRunLoop(stream, CFRunLoopGetMain(), CFRunLoopMode.defaultMode.rawValue)
        FSEventStreamStart(stream)
    }
    
    public func release() {
        callback = nil
    }
    
    public func stop() {
        FSEventStreamStop(stream)
    }
    
    public func resume() {
        FSEventStreamStart(stream)
    }
}
