// swift-tools-version: 5.9

import Foundation
import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "MetaCodableDemo",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
    .macCatalyst(.v13),
  ],
  products: [
    .library(name: "Models", targets: ["Models"])
  ],
  dependencies: [
    .package(url: "https://github.com/SwiftyLab/MetaCodable.git", from: "1.0.0"),
  ],
  targets: [
    // MARK: Core
    .target(
      name: "Models",
      dependencies: [
        .product(name: "MetaCodable", package: "MetaCodable"),
        .product(name: "HelperCoders", package: "MetaCodable"),
      ],
      plugins: [
        .plugin(name: "MetaProtocolCodable", package: "MetaCodable")
      ]
    )
  ]
)
