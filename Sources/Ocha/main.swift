import Foundation
import OchaCore

print("Hello, world!")

let watcher = Watcher(paths: [#file])
watcher.start { (events) in
    print("Yeaaaaaaaaaaaaaaaaaaa!")
    print(events)
}

while true { }
