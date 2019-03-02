//
//  Entrypoint.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public class Watcher {
    public typealias CallBack = ([FileEvent]) -> Void
    
    private lazy var context = FSEventStreamContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
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
    
    private var _callback: FSEventStreamCallback = { (stream, contextInfo, numEvents, eventPaths, eventFlags, eventIds) in
        guard let paths = unsafeBitCast(eventPaths, to: NSArray.self) as? [String] else {
            assertionFailure()
            return
        }
        if numEvents > 0 {
            let fileEvents = (0..<numEvents).map { i in FileEvent(id: eventIds[i], flag: eventFlags[i], path: paths[i]) }
            Watcher.instance.callback?(fileEvents)
        }
    }
    
    public var paths: [String] = []
    public static let instance = Watcher()
    private init() { }
    
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
