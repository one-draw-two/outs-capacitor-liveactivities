// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Outs1x2CapacitorLiveactivities",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Outs1x2CapacitorLiveactivities",
            targets: ["CapLiveActivitiesPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "CapLiveActivitiesPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/CapLiveActivitiesPlugin"),
        .testTarget(
            name: "CapLiveActivitiesPluginTests",
            dependencies: ["CapLiveActivitiesPlugin"],
            path: "ios/Tests/CapLiveActivitiesPluginTests")
    ]
)