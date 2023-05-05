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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", branch: "beta"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", branch: "beta")
	],
	targets: [
		.target(name: "GXUCLinearGaugeWrapper",
				dependencies: [
					"GXUCLinearGauge",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCLinearGauge",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCLinearGauge-1.0.0-beta+20230505123704.xcframework.zip",
			checksum: "2ed879e2331f98daddefb52a2dfae4169a4f8f9842025de13b04cfe7abe637e3"
		)
	]
)