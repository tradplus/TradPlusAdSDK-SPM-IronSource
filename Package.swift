// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusIronSourceAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusIronSourceAdapter",
            targets: ["TradPlusIronSourceAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/ironsource-mobile/LevelPlay-Swift-Package.git",
            .exact("9.7.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusIronSourceAdapter",
            dependencies: [
                .target(name: "TPIronSourceAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "UnityMediationSDK", package: "LevelPlay-Swift-Package"),
            ],
            path: ".",
            sources: ["Sources/TradPlusIronSourceAdapter/TradPlusIronSourceAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPIronSourceAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-IronSource/releases/download/15.18.0/TPIronSourceAdapter-15.18.0.xcframework.zip",
            checksum: "2f076fd9fbc76de128e94d2b6311988805921f36780d378095eea35b36e4ea9a"
        ),
    ]
)
