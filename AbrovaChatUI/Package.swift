// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AbrovaChatUI",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AbrovaChatUI",
            targets: ["AbrovaChatUI"]
        )
    ],
    dependencies: [
        .package(path: "../AbrovaChat"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "AbrovaChatUI",
            dependencies: [
                "AbrovaChat",
                "SDWebImageSwiftUI"
            ],
            path: "Sources/AbrovaChatUI"
        ),
        .testTarget(
            name: "AbrovaChatUITests",
            dependencies: ["AbrovaChatUI"],
            path: "Tests/AbrovaChatUITests"
        )
    ]
)
