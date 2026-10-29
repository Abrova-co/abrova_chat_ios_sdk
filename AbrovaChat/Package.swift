// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AbrovaChat",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AbrovaChat",
            targets: ["AbrovaChat"]
        ),
    ],
    dependencies: [
        // Realtime WebSocket client
        .package(url: "https://github.com/centrifugal/centrifuge-swift.git", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "AbrovaChat",
            dependencies: [
                .product(name: "SwiftCentrifuge", package: "centrifuge-swift"),
            ],
            path: "Sources/AbrovaChat"
        ),
        .testTarget(
            name: "AbrovaChatTests",
            dependencies: ["AbrovaChat"],
            path: "Tests/AbrovaChatTests"
        ),
    ]
)
