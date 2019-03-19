// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let exampleDependencies: [PackageDescription.Target.Dependency] = ["Ocha", "SwiftShell", "PathKit"]
enum ExampleType: String, CaseIterable { 
  case Ragnarok
  case SwiftLint

  var name: String {
    return rawValue + "Example" 
  }

  var packageURL: String {
    switch self {
    case .Ragnarok:
      return "https://github.com/bannzai/Ragnarok.git"
    case .SwiftLint:
      return "https://github.com/realm/SwiftLint.git"
    }
  }

  var version: Version {
    switch self {
    case .Ragnarok:
      return Version(1, 0, 2)
    case .SwiftLint:
      return Version(0, 31, 0)
    }
  }

  var targetDependency: PackageDescription.Target.Dependency {
    switch self {
    case .Ragnarok:
      return "RagnarokCore"
    case .SwiftLint:
      return "SwiftLintFramework"
    }
  }

  var targetDependencies: [PackageDescription.Target.Dependency] {
    return exampleDependencies + [targetDependency]
  }

  var product: Product {
    return .executable(name: name, targets: [name])
  }

  var dependency: Package.Dependency {
    return .package(url: packageURL, from: version) 
  }

  var target: Target {
    return .target(name: name, dependencies: targetDependencies)
  }
}

let package = Package(
    name: "Ocha",
    products: [.library(name: "Ocha", targets: ["Ocha"])] + ExampleType.allCases.map { $0.product },
    dependencies: [
        .package(url: "https://github.com/kareman/SwiftShell.git", from: Version(4, 1, 2)),
        .package(url: "https://github.com/kylef/PathKit.git", from: Version(0, 9, 2)),
    ] + ExampleType.allCases.map { $0.dependency },
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Ocha",
            dependencies: []),
        .testTarget(
            name: "OchaTests",
            dependencies: ["Ocha"]),
    ] + ExampleType.allCases.map { $0.target }
)

