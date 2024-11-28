// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCLinearGauge",
	platforms: [.iOS("12.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCLinearGauge",
			targets: ["GXUCLinearGaugeWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.2.0-beta.18")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCLinearGauge-2.2.0-beta.18.xcframework.zip",
			checksum: "2c95ab037cdb22eeda4af08552785709e37b69ae7328764965b0dd25dc126004"
		)
	]
)