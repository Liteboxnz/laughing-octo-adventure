// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LaughingOctoAdventure",
    products: [
        .library(
            name: "LaughingOctoAdventure",
            targets: ["LaughingOctoAdventure"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LaughingOctoAdventure",
            dependencies: []),
        .testTarget(
            name: "LaughingOctoAdventureTests",
            dependencies: ["LaughingOctoAdventure"]),
    ]
)
