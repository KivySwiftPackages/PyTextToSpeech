// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "PyTextToSpeech",
	platforms: [.iOS(.v13)],
	products: [
		.library(name: "PyTextToSpeech", targets: ["PyTextToSpeech"])
	],
	dependencies: [
        .package(url: "https://github.com/Py-Swift/PySwiftKit", from: .init(311, 0, 0)),
        //.package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", from: .init(0, 0, 0)),
	],
	targets: [
		.target(
			name: "PyTextToSpeech",
			dependencies: [
                .product(name: "SwiftonizeModules", package: "PySwiftKit"),
			]
		),

	]
)
