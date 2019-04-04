<div align="center" style="margin-bottom:20px" >
  <img width="70%" src="logo/ocha_logo.png" />
</div>

<p align="center">
  <a href="https://developer.apple.com/swift"><img alt="Swift4" src="https://img.shields.io/badge/language-swift4-blue.svg?style=flat"/></a>
  <a href="https://developer.apple.com/swift/"><img alt="Platform" src="https://img.shields.io/badge/platform-macOS-green.svg"/></a>
  <a href="https://github.com/bannzai/Conv/blob/master/LICENSE.txt"><img alt="Lincense" src="http://img.shields.io/badge/license-MIT-000000.svg?style=flat"/></a>
</p>

# Ocha
`Ocha` can be listen to the file system change notifications and raises events when a directory, or file in a directory, changes.

Ocha means Tea🍵 in Japan.

## Usage
To use Ocha, first create a `Watcher` instance with file paths you want to watch.

```swift
let watcher = Watcher(paths: [pathString])
```

And you can call for `Watcher.start(_:)` method when it start to watch file events.
When file removed, you get callback with removed file path infomations.

```swift
watcher.start { (events) in ... }
```

## Example

The following example execute `git add << REMOVED_FILE_PATH >>` and `git commit -m << REMOVED_FILE_PATH >>` to watch the file path, when it removed.

```swift
import Foundation
import Ocha
import SwiftShell
import PathKit

let path: Path = .init(
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
        .filter { $0.flag.contains(.removedFile) || $0.flag.contains(.removedDirectory) }
        .map { $0.path }
    Set(removedEventPaths).forEach { path in
        main.run(bash: "git add \(path)")
        main.run(bash: "git commit -m \"Delete file \(path)\"")
    }
}

RunLoop.current.run()
```

If you execute this swift code, you can confirm removed file git log. `$ git log -1` 


## LICENSE
[Ocha](https://github.com/bannzai/Ocha/) is released under the MIT license. See [LICENSE](https://github.com/bannzai/Ocha/blob/master/LICENSE.txt) for details.

Header logo is released [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/deed) license. Original design by [noainoue](https://github.com/noainoue).
