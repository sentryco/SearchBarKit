// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SearchBarKit",
    platforms: [
      .macOS(.v14),
      .iOS(.v17)
    ],
    products: [
        .library(
            name: "SearchBarKit",
            targets: ["SearchBarKit"]),
    ],
    dependencies: [
      .package(url: "https://github.com/sentryco/HybridColor", branch: "main"),
    ],
    targets: [
      .target(
         name: "SearchBarKit",
         dependencies: [
            .product(name: "HybridColor", package: "HybridColor"),
         ]),
      .testTarget(
         name: "SearchBarKitTests",
         dependencies: ["SearchBarKit"])
    ]
)
