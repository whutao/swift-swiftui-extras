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
    dependencies: [
        .package(url: "https://github.com/whutao/swift-core-graphics-extras", from: Version(1, 0, 0)),
        .package(url: "https://github.com/whutao/swift-extras", from: Version(2, 0, 0)),
    ],
    targets: [
        .target(
            name: "SwiftUIExtras",
            dependencies: [
                .product(name: "CoreGraphicsExtras", package: "swift-core-graphics-extras"),
                .product(name: "SwiftExtras", package: "swift-extras")
            ]
        )
    ]
)
