import Foundation
import Ocha
import SwiftShell
import PathKit


print("You can confirm for `Ocha` is watched file changes when edit and save this file.")

let path = Path(#file)
let pathString = path.absolute().string
let watcher = Watcher(paths: [pathString])
watcher.start { (events) in
    print(events)
    if events.isAddedFileInXcodeEvent() {
        print("xcode added: \(events.extractAddedFileWhenAddedFromXcode())")
    }
    events.forEach { event in
        print("------- path: \(event.path) --------")
        EventSet.allCases.forEach { set in
            print("\(set): \(event.flag.contains(set))")
        }
    }
}

RunLoop.current.run()
