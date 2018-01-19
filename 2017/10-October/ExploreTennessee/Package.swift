// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ExploreTennessee",
    products: [
        .executable(
            name: "ExploreTennesseeServer",
            targets: ["ExploreTennessee"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "1.7.9"),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.8.3"),
        .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "1.2.4")
    ],
    targets: [
        .target(
            name: "ExploreTennessee",
            dependencies: ["Kitura", "KituraStencil", "SwiftMetrics"]
        ),
        .target(
            name: "ExploreTennesseeTests",
            dependencies: ["ExploreTennessee"]
        )
    ]
)
