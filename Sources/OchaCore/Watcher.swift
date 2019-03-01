//
//  Entrypoint.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public class Presenter: NSObject, NSFilePresenter {
    public var presentedItemURL: URL?
    public let presentedItemOperationQueue: OperationQueue = OperationQueue.main
    
    public func presentedItemDidChange() {
        print(#function)
    }
}

public class Watcher {
    public typealias CallBack = ([FileEvent]) -> Void
    
    private let paths: [String]

    public init(paths: [Pathable]) {
        self.paths = paths.map { $0.pathForWatching().absoluteString }
        self.presenter.presentedItemURL = paths[0].pathForWatching()
    }
    
    private var callback: CallBack?
    private var presenter: Presenter = Presenter()
    public func start(_ callback: @escaping CallBack) {
        self.callback = callback
        NSFileCoordinator.addFilePresenter(presenter)
    }
    
    public func release() {
        callback = nil
    }
    
    public func stop() {
        
    }
    
    public func resume() {
    }
}
