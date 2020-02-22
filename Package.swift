// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "render",
    products: [
        .library(name: "render", targets: ["render"]),
        .executable(name: "example", targets: ["example"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "render",
            dependencies: []),
        .target(
            name: "example",
            dependencies: ["render"]),
        .testTarget(
            name: "renderTests",
            dependencies: ["render"]),
    ]
)
