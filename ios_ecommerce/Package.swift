// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AbrovaChatEcommerce",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "AbrovaChatEcommerce",
            targets: ["AbrovaChatEcommerce"]
        )
    ],
    dependencies: [
        .package(path: "../AbrovaChat"),
        .package(path: "../AbrovaChatUI"),
        .package(url: "https://center.abrova.ir/abrova/abrova-push-ios-sdk.git", from: "0.1.3")
    ],
    targets: [
        .target(
            name: "AbrovaChatEcommerce",
            dependencies: ["AbrovaChat", "AbrovaChatUI", "AbrovaPush"],
            path: "AbrovaChatEcommerce"
        )
    ]
)
