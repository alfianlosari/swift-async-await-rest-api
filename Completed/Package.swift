// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "async-api",
    platforms: [
        .macOS(.v11),
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "async-api",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-parse-as-library"]),
                .unsafeFlags(["-Xfrontend", "-enable-experimental-concurrency"]),
                .unsafeFlags(["-Xfrontend", "-disable-availability-checking"])
            ]),
        .testTarget(
            name: "async-apiTests",
            dependencies: ["async-api"]),
    ]
)
