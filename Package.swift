// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "GDCWebServer",
	platforms: [
		.macOS(.v10_15),
		.iOS(.v13),
	],
	products: [
		.library(
			name: "GDCWebServer",
			targets: ["GDCWebServer"]),
	],
	dependencies: [
	],
	targets: [
		.target(
			name: "GDCWebServer",
			dependencies: [],
			path: ".",
			exclude: ["README.md"],
			sources: ["Core", "Requests", "Responses"],
			publicHeadersPath: "include")
	]
)
