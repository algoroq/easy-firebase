// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "EasyFirebase",
  platforms: [.iOS(.v11), .macOS(.v10_15), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "EasyFirebase",
      targets: ["EasyFirebase"]),
  ],
  dependencies: [
    .package(url: "https://github.com/firebase/firebase-ios-sdk", .upToNextMajor(from: "10.0.0")),
    .package(url: "https://github.com/google/GTMAppAuth.git", from: "1.0.0"),
    .package(url: "https://github.com/openid/AppAuth-iOS.git", from: "1.0.0"),
    .package(url: "https://github.com/benlmyers/GAppAuth", from: "1.6.4"),
  ],
  targets: [
    .target(
      name: "EasyFirebase",
      dependencies: [
        .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
        .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
        .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk"),
        .product(name: "FirebaseMessaging", package: "firebase-ios-sdk"),
        .product(name: "FirebaseStorage", package: "firebase-ios-sdk"),
        .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
        .product(name: "FirebaseAnalyticsSwift", package: "firebase-ios-sdk"),
        .product(name: "FirebaseDynamicLinks", package: "firebase-ios-sdk", condition: .when(platforms: [.iOS])),
        .product(name: "GTMAppAuth", package: "GTMAppAuth"),
        .product(name: "AppAuth", package: "AppAuth-iOS"),
        .product(name: "GAppAuth-macOS", package: "GAppAuth"),
        .product(name: "GAppAuth-iOS", package: "GAppAuth"),
        .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
        .product(name: "FirebaseRemoteConfigSwift", package: "firebase-ios-sdk")
      ]
    ),
//    .testTarget(
//      name: "EasyFirebaseTests",
//      dependencies: ["EasyFirebase"]),
  ]
)
