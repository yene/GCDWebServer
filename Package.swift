// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "GCDWebServer",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
	],
	products: [
		.library(
			name: "GCDWebServer",
			targets: ["GCDWebServer"]),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "GCDWebServer",
			dependencies: [],
			path: ".",
			exclude: ["README.md"],
			sources: ["Core", "Requests", "Responses"],
			publicHeadersPath: "include")
	]
)
