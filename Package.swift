// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NCM",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "NCM", targets: ["NCM"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "NCM"),
        .testTarget(name: "NCMTests", dependencies: ["NCM"]),
    ]
)
