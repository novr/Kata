// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "DemoApp",
    platforms: [
        .iOS(.v17),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "DemoApp",
            targets: ["DemoApp"]
        ),
    ],
    dependencies: [
        .package(path: "../"),
        .package(url: "https://github.com/eure/swift-storybook.git", from: "2.9.1"),
    ],
    targets: [
        .target(
            name: "DemoApp",
            dependencies: [
                "Kata",
                .product(name: "StorybookKit", package: "swift-storybook"),
            ]
        ),
    ]
)
