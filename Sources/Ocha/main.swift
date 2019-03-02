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
let watcher = Watcher.instance
watcher.paths = [file]
watcher.start { (events) in
    print("Yeaaaaaaaaaaaaaaaaaaa!")
    print(events)
}

let (writableStream, readableStream) = SwiftShell.streams()
class Container {
    lazy var process: Process = {
        let process = Process()
        process.launchPath = "/usr/bin/env"
        process.arguments = ["tail", "-f", "/Users/hiroseyuudai/develop/oss/Ocha/Sources/ocha/main.swift"]
        process.standardInput = writableStream.filehandle
        process.standardOutput = readableStream.filehandle
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
        
        return process
    }()
    
    func launch() {
        process.launch()
        process.waitUntilExit()
    }
}


//Container().launch()

RunLoop.current.run()
print("Process End")


