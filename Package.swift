// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ocha",
    products: [
        .library(name: "Ocha", targets: ["Ocha"]),
        .executable(name: "OchaExample", targets: ["OchaExample"]),
        ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kareman/SwiftShell.git", from: Version(4, 1, 2)),
        .package(url: "https://github.com/kylef/PathKit.git", from: Version(0, 9, 2)),
        .package(url: "https://github.com/bannzai/Ragnarok.git", from: Version(1, 0, 0)),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Ocha",
            dependencies: []),
        .target(
            name: "OchaExample",
            dependencies: ["Ocha", "SwiftShell", "PathKit", "RagnarokCore"]),
        .testTarget(
            name: "OchaTests",
            dependencies: ["Ocha"]),
    ]
)

