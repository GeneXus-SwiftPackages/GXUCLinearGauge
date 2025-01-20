// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCLinearGauge",
	platforms: [.iOS("13.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCLinearGauge",
			targets: ["GXUCLinearGaugeWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-rc.8")
	],
	targets: [
		.target(name: "GXUCLinearGaugeWrapper",
				dependencies: [
					"GXUCLinearGauge",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCLinearGauge",
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCLinearGauge-3.0.0-rc.8.xcframework.zip",
			checksum: "c15c905aa6ade6c70a1a405b17d145a44208f29be1baedf4778582f6a7fb2491"
		)
	]
)