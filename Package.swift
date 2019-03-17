// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let exampleDependencies = ["Ocha", "SwiftShell", "PathKit"]
enum ExampleType: String, CaseIterable { 
  case Ragnarok
  case IBOutletReWriter
  case SwiftLint

  var name: String {
    return rawValue + "Example" 
  }

  var packageName: String {
    switch self {
    case .Ragnarok:
      return "https://github.com/bannzai/Ragnarok.git"
    case .IBOutletRewriter:
      return "https://github.com/kitasuke/IBOutletRewriter.git"
    case .SwiftLint:
      return "https://github.com/realm/SwiftLint.git"
    }
  }

  var version: Version {
    switch self {
    case .Ragnarok:
      return Version(1, 0, 2)
    case .IBOutletRewriter:
      return Version(0, 1, 0)
    case .SwiftLint:
      return Version(0, 31, 0)
    }
  }

  var targetDependency: String {
    switch self {
    case .Ragnarok:
      return "RagnarokCore"
    case .IBOutletRewriter:
      return "IBOutletRewriterCore"
    case .SwiftLint:
      return "SwiftLintFramework"
    }
  }

  var targetDependencies: [String] {
    return exampleDependencies + [targetDependency]
  }
}

struct ExampleElement {
  static let products: [Product] = ExampleType.allCases.map { .executable(name: $0.name, targets: [$0.name]) }
  static let dependencies: [Package.Dependency] = ExampleElement.allCases.map { .package(url: $0.packageName, from: $0.version) }
  static let targets: [Target] = ExampleElement.allCases.map { .target(name: $0.name, dependencies: $0.targetDependencies) }
}

let package = Package(
    name: "Ocha",
    products: [.library(name: "Ocha", targets: ["Ocha"])] + ExampleElement.products ,
    dependencies: [
        .package(url: "https://github.com/kareman/SwiftShell.git", from: Version(4, 1, 2)),
        .package(url: "https://github.com/kylef/PathKit.git", from: Version(0, 9, 2)),
        .package(url: "https://github.com/bannzai/Ragnarok.git", from: Version(1, 0, 2)),
    ] + ExampleElement.dependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Ocha",
            dependencies: []),
        .testTarget(
            name: "OchaTests",
            dependencies: ["Ocha"]),
    ] + ExampleElement.targets
)

