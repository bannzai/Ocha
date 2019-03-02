//
//  EventSet.swift
//  OchaCore
//
//  Created by Yudai.Hirose on 2019/03/01.
//

import Foundation


//print("kFSEventStreamEventFlagNone: \(kFSEventStreamEventFlagNone)")
//print("kFSEventStreamEventFlagMustScanSubDirs: \(kFSEventStreamEventFlagMustScanSubDirs)")
//print("kFSEventStreamEventFlagUserDropped: \(kFSEventStreamEventFlagUserDropped)")
//print("kFSEventStreamEventFlagKernelDropped: \(kFSEventStreamEventFlagKernelDropped)")
//print("kFSEventStreamEventFlagEventIdsWrapped: \(kFSEventStreamEventFlagEventIdsWrapped)")
//print("kFSEventStreamEventFlagHistoryDone: \(kFSEventStreamEventFlagHistoryDone)")
//print("kFSEventStreamEventFlagRootChanged: \(kFSEventStreamEventFlagRootChanged)")
//print("kFSEventStreamEventFlagMount: \(kFSEventStreamEventFlagMount)")
//print("kFSEventStreamEventFlagUnmount: \(kFSEventStreamEventFlagUnmount)")
//print("kFSEventStreamEventFlagItemCreated: \(kFSEventStreamEventFlagItemCreated)")
//print("kFSEventStreamEventFlagItemRemoved: \(kFSEventStreamEventFlagItemRemoved)")
//print("kFSEventStreamEventFlagItemInodeMetaMod: \(kFSEventStreamEventFlagItemInodeMetaMod)")
//print("kFSEventStreamEventFlagItemRenamed: \(kFSEventStreamEventFlagItemRenamed)")
//print("kFSEventStreamEventFlagItemModified: \(kFSEventStreamEventFlagItemModified)")
//print("kFSEventStreamEventFlagItemFinderInfoMod: \(kFSEventStreamEventFlagItemFinderInfoMod)")
//print("kFSEventStreamEventFlagItemChangeOwner: \(kFSEventStreamEventFlagItemChangeOwner)")
//print("kFSEventStreamEventFlagItemXattrMod: \(kFSEventStreamEventFlagItemXattrMod)")
//print("kFSEventStreamEventFlagItemIsFile: \(kFSEventStreamEventFlagItemIsFile)")
//print("kFSEventStreamEventFlagItemIsDir: \(kFSEventStreamEventFlagItemIsDir)")
//print("kFSEventStreamEventFlagItemIsSymlink: \(kFSEventStreamEventFlagItemIsSymlink)")
//print("kFSEventStreamEventFlagOwnEvent: \(kFSEventStreamEventFlagOwnEvent)")
//print("kFSEventStreamEventFlagItemIsHardlink: \(kFSEventStreamEventFlagItemIsHardlink)")
//print("kFSEventStreamEventFlagItemIsLastHardlink: \(kFSEventStreamEventFlagItemIsLastHardlink)")
//if #available(OSX 10.13, *) {
//    print("kFSEventStreamEventFlagItemCloned: \(kFSEventStreamEventFlagItemCloned)")
//} else {
//    // Fallback on earlier versions
//}


struct EventSet: OptionSet {
    let rawValue: Int
    typealias RawValue = Int
    
    static let none = EventSet(rawValue: kFSEventStreamEventFlagNone) // 0
    static let mustScanSubDirs = EventSet(rawValue: kFSEventStreamEventFlagMustScanSubDirs) // 1
    static let userDropped = EventSet(rawValue: kFSEventStreamEventFlagUserDropped) // 2
    static let kernelDropped = EventSet(rawValue: kFSEventStreamEventFlagKernelDropped) // 4
    static let eventIdsWrapped = EventSet(rawValue: kFSEventStreamEventFlagEventIdsWrapped) // 8
    static let historyDone = EventSet(rawValue: kFSEventStreamEventFlagHistoryDone) // 16
    static let rootChanged = EventSet(rawValue: kFSEventStreamEventFlagRootChanged) // 32
    static let mount = EventSet(rawValue: kFSEventStreamEventFlagMount) // 64
    static let unmount = EventSet(rawValue: kFSEventStreamEventFlagUnmount) // 128
    static let itemCreated = EventSet(rawValue: kFSEventStreamEventFlagItemCreated) // 256
    static let itemRemoved = EventSet(rawValue: kFSEventStreamEventFlagItemRemoved) // 512
    static let itemInodeMetaMod = EventSet(rawValue: kFSEventStreamEventFlagItemInodeMetaMod) // 1024
    static let itemRenamed = EventSet(rawValue: kFSEventStreamEventFlagItemRenamed) // 2048
    static let itemModified = EventSet(rawValue: kFSEventStreamEventFlagItemModified) // 4096
    static let itemFinderInfoMod = EventSet(rawValue: kFSEventStreamEventFlagItemFinderInfoMod) // 8192
    static let itemChangeOwner = EventSet(rawValue: kFSEventStreamEventFlagItemChangeOwner) // 16384
    static let itemXattrMod = EventSet(rawValue: kFSEventStreamEventFlagItemXattrMod) // 32768
    static let itemIsFile = EventSet(rawValue: kFSEventStreamEventFlagItemIsFile) // 65536
    static let itemIsDir = EventSet(rawValue: kFSEventStreamEventFlagItemIsDir) // 131072
    static let itemIsSymlink = EventSet(rawValue: kFSEventStreamEventFlagItemIsSymlink) // 262144
    static let ownEvent = EventSet(rawValue: kFSEventStreamEventFlagOwnEvent) // 524288
    static let itemIsHardlink = EventSet(rawValue: kFSEventStreamEventFlagItemIsHardlink) // 1048576
    static let itemIsLastHardlink = EventSet(rawValue: kFSEventStreamEventFlagItemIsLastHardlink) // 2097152
    @available(OSX 10.13, *)
    static let itemCloned = EventSet(rawValue: kFSEventStreamEventFlagItemCloned) // 4194304
    
}

//kFSEventStreamEventFlagNone: 0
//kFSEventStreamEventFlagMustScanSubDirs: 1
//kFSEventStreamEventFlagUserDropped: 2
//kFSEventStreamEventFlagKernelDropped: 4
//kFSEventStreamEventFlagEventIdsWrapped: 8
//kFSEventStreamEventFlagHistoryDone: 16
//kFSEventStreamEventFlagRootChanged: 32
//kFSEventStreamEventFlagMount: 64
//kFSEventStreamEventFlagUnmount: 128
//kFSEventStreamEventFlagItemCreated: 256
//kFSEventStreamEventFlagItemRemoved: 512
//kFSEventStreamEventFlagItemInodeMetaMod: 1024
//kFSEventStreamEventFlagItemRenamed: 2048
//kFSEventStreamEventFlagItemModified: 4096
//kFSEventStreamEventFlagItemFinderInfoMod: 8192
//kFSEventStreamEventFlagItemChangeOwner: 16384
//kFSEventStreamEventFlagItemXattrMod: 32768
//kFSEventStreamEventFlagItemIsFile: 65536
//kFSEventStreamEventFlagItemIsDir: 131072
//kFSEventStreamEventFlagItemIsSymlink: 262144
//kFSEventStreamEventFlagOwnEvent: 524288
//kFSEventStreamEventFlagItemIsHardlink: 1048576
//kFSEventStreamEventFlagItemIsLastHardlink: 2097152
//kFSEventStreamEventFlagItemCloned: 4194304
//
//
