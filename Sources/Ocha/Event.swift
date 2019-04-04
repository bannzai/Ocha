//
//  Event.swift
//  Ocha
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation

public final class Event: NSObject {
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

extension Event {
    public override var debugDescription: String {
        return """
        Event {
            type: \(type(of: self))
            address: \(Unmanaged.passUnretained(self).toOpaque())
            id: \(id),
            flag: \(flag),
            path: \(path),
        }
        """
    }
    
    public override var description: String {
        return debugDescription
    }
}

// MARK: - Specify Xcode event
extension Array where Element == Event {
    public func isAddedFileInXcodeEvent() -> Bool {
        guard count == 2 else {
            return false
        }
        
        let temporaryFile = self[0]
        if !temporaryFile.path.contains(".dat.") {
            return false
        }
        if !temporaryFile.flag.contains(.xcodeFileAddedFirstEventSet) {
            return false
        }

        let renamedFromTemporaryFile = self[1]
        if !renamedFromTemporaryFile.flag.contains(.xcodeFileAddedSecondEventSet) {
            return false
        }
        
        return true
    }
    
    public func extractAddedFileWhenAddedFromXcode() -> Event {
        assert(isAddedFileInXcodeEvent())
        return self[1]
    }
}
