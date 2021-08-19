// swift-tools-version:5.4

import PackageDescription


let package = Package(
    name: "Demo",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(
            name: "Demo",
            targets: ["Demo"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.3.0"))
    ],
    targets: [
        .executableTarget(
            name: "Demo",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniREST", package: "Apodini"),
                .product(name: "ApodiniOpenAPI", package: "Apodini")
            ]
        ),
        .testTarget(
            name: "DemoTests",
            dependencies: ["Demo"]
        )
    ]
)
