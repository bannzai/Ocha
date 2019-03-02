//
//  WatchingPathable.swift
//  OchaTests
//
//  Created by Yudai.Hirose on 2019/03/02.
//

import Foundation

public protocol WatchingPathable {
    func watchingPath() -> String
}

extension URL: WatchingPathable {
    public func watchingPath() -> String {
        return absoluteString
    }
}

extension String: WatchingPathable {
    public func watchingPath() -> String {
        return self
    }
}
