import Foundation
import OchaCore
import SwiftShell
import PathKit


//do {
//    let file = #file
//    print("Hello, world!: \(file)")
//    let watcher = Watcher(paths: [file])
//    watcher.start { (events) in
//        print("Yeaaaaaaaaaaaaaaaaaaa!")
//        print(events)
//    }
//}


let path = Path("/Users/hiroseyuudai/develop/oss/Ocha/Sources/Ocha")
let file = path.absolute().string
print("exists: \(path.exists)")
print("Hello, world!: \(file)")
let watcher = Watcher(paths: [file])
watcher.start { (events) in
    print("Yeaaaaaaaaaaaaaaaaaaa!")
    print(events)
    if events.isAddedFileInXcodeEvent() {
        print("xcode added: \(events.extractAddedFileWhenAddedFromXcode())")
    }
    events.forEach { event in
        print("------- path: \(event.path) --------")
//        print("cat: " + main.run(bash: "cat \(event.path)").stdout)
        EventSet.allCases.forEach { set in
            print("\(set): \(event.flag.contains(set))")
        }
    }
}

RunLoop.current.run()
print("Process End")
