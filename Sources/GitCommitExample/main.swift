import Foundation
import Ocha
import SwiftShell
import PathKit

print("You can confirm `Ocha.GitCommitExample` when removed file. Try rm -f Package.swift and conform git history(e.g git show. You can got new commit for it message of 'Delete file [Package.swift] path'. ")

let path = Path(
    #file.components(separatedBy: "/")
        .dropLast() // main.swift
        .dropLast() // GitCommitExample
        .dropLast() // Sources
        .joined(separator: "/")
)
let pathString = path.absolute().string
main.currentdirectory = pathString

let watcher = Watcher(paths: [pathString])
watcher.start { (events) in
    let removedEventPaths = events
        .filter { $0.flag.contains(.removedFile) }
        .map { $0.path }
    removedEventPaths.forEach { path in
        main.run(bash: "git add \(path)")
        main.run(bash: "git commit -m \"Delete file \(path)\"")
    }
}

RunLoop.current.run()
