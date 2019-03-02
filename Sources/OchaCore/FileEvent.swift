//
//  FileEvent.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public final class FileEvent : NSObject {
    public var id: UInt64
    public var flag: EventSet
    public var path: String
    
    public init(
        id: UInt64,
        flag: Int,
        path: String
        ) {
        self.id = id
        self.flag = EventSet(rawValue: flag)
        self.path = path
    }
}
