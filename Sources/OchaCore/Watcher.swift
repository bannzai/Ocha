//
//  Entrypoint.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public class Watcher {
    public typealias CallBack = ([FileEvent]) -> Void
    
    private let paths: [String]
    private lazy var stream: FSEventStreamRef = {
        var context = FSEventStreamContext(version: 0, info: UnsafeMutableRawPointer(mutating: Unmanaged.passUnretained(self).toOpaque()), retain: nil, release: nil, copyDescription: nil)
        let stream = FSEventStreamCreate(kCFAllocatorDefault, _callback, &context, paths as CFArray, FSEventStreamEventId(kFSEventStreamEventIdSinceNow), 0, UInt32(kFSEventStreamCreateFlagUseCFTypes | kFSEventStreamCreateFlagFileEvents))!
        return stream
    }()
    
    private let _callback: FSEventStreamCallback = { (stream, contextInfo, numEvents, eventPaths, eventFlags, eventIds) in
        let watcher = unsafeBitCast(contextInfo, to: Watcher.self)
        let paths = unsafeBitCast(eventPaths, to: [String].self)
        let fileEvents = (0..<numEvents).map { i in FileEvent(id: eventIds[i], flag: eventFlags[i], path: paths[i]) }
        watcher.callback?(fileEvents)
    }
    
    public init(paths: [String]) {
        self.paths = paths
    }
    
    public var callback: CallBack?
    public func start(_ callback: @escaping CallBack) {
        self.callback = callback
        FSEventStreamScheduleWithRunLoop(stream, RunLoop.current.getCFRunLoop(), CFRunLoopMode.defaultMode.rawValue)
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
