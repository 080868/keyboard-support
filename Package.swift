// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "SwiftUILib-KeyboardSupport",
  platforms: [ .iOS(.v13) ],
  products: [
    .library(
      name: "SwiftUILib.KeyboardSupport",
      targets: ["SwiftUILib_KeyboardSupport"]),
  ],
  targets: [
    .target(
      name: "SwiftUILib_KeyboardSupport",
      path: "src"),
    .testTarget(
      name: "SwiftUILib-KeyboardSupportTests",
      dependencies: ["SwiftUILib_KeyboardSupport"],
      path: "test"),
  ]
)
