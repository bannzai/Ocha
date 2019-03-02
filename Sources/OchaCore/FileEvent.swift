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
    public var path: String
    
    public init(
        id: UInt64,
        flag: UInt32,
        path: String
        ) {
        self.id = id
        self.flag = flag
        self.path = path
    }
}
