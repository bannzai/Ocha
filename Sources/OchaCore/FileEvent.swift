//
//  FileEvent.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public final class FileEvent : NSObject {
    public var id: UInt64
    public var flag: UInt32
    public var path: Pathable
    
    public init(
        id: UInt64,
        flag: UInt32,
        path: Pathable
        ) {
        self.id = id
        self.flag = flag
        self.path = path
    }
}
