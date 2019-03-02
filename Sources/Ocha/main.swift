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
}

RunLoop.current.run()
print("Process End")


