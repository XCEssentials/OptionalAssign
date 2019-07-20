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
    targets: [
        .target(
            name: "XCEOptionalAssign",
            path: "Sources/Core"
        ),
        .testTarget(
            name: "XCEOptionalAssignAllTests",
            dependencies: [
                "XCEOptionalAssign"
            ],
            path: "Tests/AllTests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)