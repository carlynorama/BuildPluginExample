// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FruitStoreBuild",
    products: [
        // Products can be used to vend plugins, making them visible to other packages.
        .plugin(
            name: "FruitStoreBuild",
            targets: ["FruitStoreBuild"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "my-code-generator",
            path: "Sources/FruitStoreBuildTool"
        ),
        .plugin(
            name: "FruitStoreBuild",
            capability: .buildTool(),
            dependencies: ["my-code-generator"]
        ),
    ]
)
