// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Antifraud-SPM",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Antifraud-SPM",
            type: .dynamic,
            targets: ["Antifraud-SPM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bespot/sharedSPM.git", exact: "1.0.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Antifraud-SPM",
            dependencies: [
                .target(name: "AntifraudSDK"),
                .product(name: "sharedSPM", package: "sharedSPM")
            ]
        ),
        .testTarget(
            name: "Antifraud-SPMTests",
            dependencies: ["Antifraud-SPM"]),
        .binaryTarget(
            name: "AntifraudSDK",
            url: "https://github.com/bespot/Antifraud-SPM/releases/download/1.0.5/AntifraudSDK.xcframework.zip",
            checksum: "fa76fb286fb86e076b2b0c8536f5bdea549086e68a9500792888d21f9da2bbc7")
    ]
)
