import Foundation
import OchaCore


//do {
//    let file = #file
//    print("Hello, world!: \(file)")
//    let watcher = Watcher(paths: [file])
//    watcher.start { (events) in
//        print("Yeaaaaaaaaaaaaaaaaaaa!")
//        print(events)
//    }
//}

let file = "/Users/hiroseyuudai/develop/oss/Ocha/Sources/ocha/"
print("Hello, world!: \(file)")
let watcher = Watcher(paths: [file])
watcher.start { (events) in
    print("Yeaaaaaaaaaaaaaaaaaaa!")
    print(events)
}


let process = Process()
let outputPipe = Pipe()
outputPipe.fileHandleForReading.readabilityHandler = {
    print($0)
}
process.launchPath = "/usr/bin/env"
process.arguments = ["/usr/local/bin/direnv", "allow"]
process.standardOutput = pipe
process.terminationHandler = { process in
    guard
        let pipe = process.standardOutput as? Pipe,
        let handle = Optional(pipe.fileHandleForReading)
        else {
            return
    }
    
    let data = handle.readDataToEndOfFile()
    
    DispatchQueue.main.async {
        print("data: \(data)")
        handle.closeFile()
        pipe.fileHandleForReading.readabilityHandler = nil
    }
}


process.launch()
process.waitUntilExit()
