// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCLinearGauge",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUCLinearGauge",
			targets: ["GXUCLinearGaugeWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.2.0-beta.37")
	],
	targets: [
		.target(name: "GXUCLinearGaugeWrapper",
				dependencies: [
					"GXUCLinearGauge",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCLinearGauge",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCLinearGauge-1.2.0-beta.37.xcframework.zip",
			checksum: "1e39615663fe736a6b7fa93fc8a9857c58c1180ebe38f2d21ef8691fabf1aa5c"
		)
	]
)