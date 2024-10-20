// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "water-sort-resolver",
  dependencies: [
    .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0")
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .executableTarget(
      name: "WaterSortResolver",
      dependencies: [
        .product(name: "Algorithms", package: "swift-algorithms")
      ]),
    .testTarget(name: "WaterSortResolverTests", dependencies: ["WaterSortResolver"]),
  ]
)
