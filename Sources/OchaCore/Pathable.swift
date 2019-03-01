//
//  Pathable.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public protocol Pathable {
    func pathForWatching() -> URL
}

extension URL: Pathable {
    public func pathForWatching() -> URL {
        return self
    }
}

extension String: Pathable {
    public func pathForWatching() -> URL {
        return URL(fileURLWithPath: self)
    }
}
