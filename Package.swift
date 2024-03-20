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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.5.0-beta.24")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCLinearGauge-1.5.0-beta.24.xcframework.zip",
			checksum: "fcc42aca7934a7cf0779a5ea8695f0b9a1826b5009b64038c1c720369407143a"
		)
	]
)