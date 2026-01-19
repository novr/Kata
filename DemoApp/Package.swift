// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DemoApp",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "DemoApp",
            targets: ["DemoApp"]
        ),
    ],
    dependencies: [
        .package(path: "../")
    ],
    targets: [
        .target(
            name: "DemoApp",
            dependencies: ["Kata"]
        ),
    ]
)
