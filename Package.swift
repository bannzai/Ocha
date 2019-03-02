// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Ocha",
    products: [
        .executable(name: "ocha", targets: ["ocha"]),
        .library(name: "OchaCore", targets: ["OchaCore"]),
        ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kareman/SwiftShell.git", from: Version(4, 1, 2)),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ocha",
            dependencies: ["OchaCore"]),
        .target(
            name: "OchaCore",
            dependencies: []),
        .testTarget(
            name: "OchaCoreTests",
            dependencies: ["OchaCore"]),
    ]
)
