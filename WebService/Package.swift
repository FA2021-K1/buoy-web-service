// swift-tools-version:5.5

import PackageDescription


let package = Package(
    name: "Buoy",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "Buoy",
            targets: ["Buoy"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.5.0")),
        .package(name: "buoy-deployment-provider", url: "https://github.com/fa21-collaborative-drone-interactions/buoy-deployment-provider", .branch("develop"))
    ],
    targets: [
        .executableTarget(
            name: "Buoy",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniREST", package: "Apodini"),
                .product(name: "ApodiniOpenAPI", package: "Apodini"),
                .product(name: "BuoyDeploymentOption", package: "buoy-deployment-provider")
            ]
        ),
        .testTarget(
            name: "BuoyTests",
            dependencies: [
                .target(name: "Buoy")
            ]
        )
    ]
)
