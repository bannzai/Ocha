import Foundation
import OchaCore

let file = #file
print("Hello, world!: \(file)")

let watcher = Watcher(paths: [file])
watcher.start { (events) in
    print("Yeaaaaaaaaaaaaaaaaaaa!")
    print(events)
}

while true { }
