//
//  FileEvent.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public final class FileEvent: NSObject {
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

extension FileEvent {
    public override var debugDescription: String {
        return """
        FileEvent {
            type: \(type(of: self))
            address: \(Unmanaged.passUnretained(self).toOpaque())
            id: \(id),
            flag: \(flag),
            path: \(path),
        }
        """
    }
}

extension Array where Element == FileEvent {
    func isAddedFileInXcodeEvent() -> Bool {
        guard count == 2 else {
            return false
        }
        
        let temporaryFile = self[0]
        if !temporaryFile.path.contains("/.dat.") {
            return false
        }
        if !temporaryFile.flag.contains([.itemCreated, .itemRenamed, .itemModified, .itemXattrMod, .itemIsFile]) {
            return false
        }

        let renamedFromTemporaryFile = self[1]
        if !renamedFromTemporaryFile.flag.contains([.itemRenamed, .itemIsFile]) {
            return false
        }
        
        return true
    }
}
