// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "bon_fastmath_package",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "bon_fastmath",
            targets: ["bon_fastmath"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "bon_fastmath", 
            url: "https://github.com/bontouch/bon-circus-fastmath/files/7629389/bon_fastmath.xcframework.zip", 
            checksum: "02feb26b8b09c129be1c08871d0a1fb956bacc411032231d938f020313fb3b76")
    ]
)
