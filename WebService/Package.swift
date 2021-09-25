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
        .package(url: "https://github.com/Apodini/Apodini.git", .upToNextMinor(from: "0.5.0"))
    ],
    targets: [
        .executableTarget(
            name: "Buoy",
            dependencies: [
                .product(name: "Apodini", package: "Apodini"),
                .product(name: "ApodiniREST", package: "Apodini"),
                .product(name: "ApodiniOpenAPI", package: "Apodini")
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
