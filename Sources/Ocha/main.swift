import Foundation
import OchaCore


do {
    let file = #file
    print("Hello, world!: \(file)")
    let watcher = Watcher(paths: [file])
    watcher.start { (events) in
        print("Yeaaaaaaaaaaaaaaaaaaa!")
        print(events)
    }
}

//do {
//    let file = "/Users/hiroseyuudai/develop/oss/Ocha/Sources/ocha/"
//    print("Hello, world!: \(file)")
//    let watcher = Watcher(paths: [file])
//    watcher.start { (events) in
//        print("Yeaaaaaaaaaaaaaaaaaaa!")
//        print(events)
//    }
//}



RunLoop.main.run()

