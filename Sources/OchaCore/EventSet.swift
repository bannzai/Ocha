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
