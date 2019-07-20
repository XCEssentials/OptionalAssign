// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "XCEOptionalAssign",
    products: [
        .library(
            name: "XCEOptionalAssign",
            targets: [
                "XCEOptionalAssign"
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/nschum/SwiftHamcrest",
            from: "2.1.1"
        )
    ],
    targets: [
        .target(
            name: "XCEOptionalAssign",
            path: "Sources/Core"
        ),
        .testTarget(
            name: "XCEOptionalAssignAllTests",
            dependencies: [
                "XCEOptionalAssign",
                "SwiftHamcrest"
            ],
            path: "Tests/AllTests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)