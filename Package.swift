// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "IBLinter",
    products: [
        .executable(
            name: "iblinter", targets: ["IBLinter"]
        ),
        .library(
            name: "IBLinterFrontend",
            type: .dynamic, targets: ["IBLinterFrontend"]
        ),
        .library(
            name: "IBLinterKit", targets: ["IBLinterKit"]
        ),
        .executable(
            name: "iblinter-tools", targets: ["Tools"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/IBDecodable/IBDecodable.git", .branch("master")),
        .package(url: "https://github.com/Carthage/Commandant.git", from: "0.15.0"),
        .package(url: "https://github.com/jpsim/SourceKitten.git", from: "0.22.0"),
        .package(url: "https://github.com/xcodeswift/xcproj.git", from: "6.6.0"),
    ],
    targets: [
        .target(
            name: "IBLinter",
            dependencies: ["IBLinterFrontend"]
        ),
        .target(
            name: "IBLinterFrontend",
            dependencies: ["IBLinterKit"]
        ),
        .target(
            name: "IBLinterKit",
            dependencies: [
                "IBDecodable", "Commandant",
                "SourceKittenFramework", "xcodeproj"
            ]
        ),
        .target(
            name: "Tools",
            dependencies: ["IBLinterKit", "Commandant"]
        ),
        .testTarget(
            name: "IBLinterKitTest",
            dependencies: ["IBLinterKit"]
        ),
    ]
)
