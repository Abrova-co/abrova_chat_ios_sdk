// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "abrova-chat-ios-sdk",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "AbrovaChat",
            targets: ["AbrovaChat"]
        ),
        .library(
            name: "AbrovaChatUI",
            targets: ["AbrovaChatUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/centrifugal/centrifuge-swift.git", from: "0.8.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "AbrovaChat",
            dependencies: [
                .product(name: "SwiftCentrifuge", package: "centrifuge-swift"),
            ],
            path: "AbrovaChat/Sources/AbrovaChat"
        ),
        .target(
            name: "AbrovaChatUI",
            dependencies: [
                "AbrovaChat",
                "SDWebImageSwiftUI",
            ],
            path: "AbrovaChatUI/Sources/AbrovaChatUI"
        ),
    ]
)
