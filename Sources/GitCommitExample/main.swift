import Foundation
import Ocha
import SwiftShell
import PathKit
import SwiftLintFramework

print("You can confirm for `Ocha` is watched file changes when edit and save this file.")

let path: Path = .init(
    #file.components(separatedBy: "/")
        .dropLast() // main.swift
        .dropLast() // GitCommitExample
        .dropLast() // Sources
        .joined(separator: "/")
)
let pathString = path.absolute().string

let watcher = Watcher(paths: [pathString])
main.currentdirectory = pathString
watcher.start { (events) in
    print(events)
    Set(events.map { $0.path }).forEach { path in
        main.run(bash: "git add \(path)")
        main.run(bash: "git commit -m \"Delete file \(path)\"")
    }
}


RunLoop.current.run()
