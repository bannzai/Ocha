import Foundation
import Ocha
import SwiftShell
import PathKit

print("You can try Ocha easily by editing this Playground. Let's add Path and processing to be monitored, then execute `swift run Playground` on Terminal.")

// Set the monitoring target path.
let path: Path = {
  fatalError("Please set the monitoring target path")
}()

let pathString = path.absolute().string
main.currentdirectory = pathString

let watcher = Watcher(paths: [pathString])
watcher.start { events in
  // Do something.
  events.forEach {
    print("[\(Date())]\n\($0)")
  }
}

RunLoop.current.run()
