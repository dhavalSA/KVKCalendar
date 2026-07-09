// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KVKCalendar",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
        .macOS(.v12),
        .tvOS(.v13),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "KVKCalendar",
            targets: ["KVKCalendar"]
        )
    ],
    dependencies: [
        // Add external dependencies here if/when needed
    ],
    targets: [
        .target(
            name: "KVKCalendar",
            dependencies: [],
            path: "Sources/KVKCalendar",
            exclude: [
                // Exclude any non-source files under Sources/KVKCalendar if present
            ],
            resources: [
                // Add resources if the library needs them, e.g. .process("Resources")
            ]
        ),
        .testTarget(
            name: "KVKCalendarTests",
            dependencies: ["KVKCalendar"],
            path: "Tests/KVKCalendarTests"
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
