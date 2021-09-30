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
        .package(name: "buoy-deployment-provider", url: "https://github.com/fa21-collaborative-drone-interactions/buoy-deployment-provider", .branch("develop")),
        .package(name: "ApodiniIoTDeploymentProvider", url: "https://github.com/Lerbert/ApodiniIoTDeploymentProvider", .branch("docker-compose"))
    ],
    targets: [
        .executableTarget(
            name: "Buoy",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniDeploy", package: "Apodini"),
                .product(name: "ApodiniHTTP", package: "Apodini"),
                .product(name: "BuoyDeploymentOption", package: "buoy-deployment-provider"),
                .product(name: "DeploymentTargetIoTRuntime", package: "ApodiniIoTDeploymentProvider")
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
