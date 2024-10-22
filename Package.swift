// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swift-swiftui-extras",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "SwiftUIExtras", targets: ["SwiftUIExtras"]),
    ],
    targets: [
        .target(name: "SwiftUIExtras")
    ]
)
