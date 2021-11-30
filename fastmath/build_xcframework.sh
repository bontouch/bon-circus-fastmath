#!/bin/sh

set -e

rm -rf ./archive
rm -rf bon_fastmath.xcframework

xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -configuration Release -destination "generic/platform=iOS" -archivePath archive/iOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -configuration Release -destination "generic/platform=iOS Simulator" -archivePath archive/iOS-Simulator BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
#xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -destination "generic/platform=tvOS" -archivePath archive/tvOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
#xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -destination "generic/platform=tvOS Simulator" -archivePath archive/tvOS-Simulator BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
#xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -destination "generic/platform=watchOS" -archivePath archive/watchOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
#xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -destination "generic/platform=watchOS Simulator" -archivePath archive/watchOS-Simulator BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
#xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -destination "generic/platform=macOS,name=Any Mac" -archivePath archive/macOS BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO
#xcodebuild archive -project fastmath.xcodeproj -scheme bon_fastmath -destination "generic/platform=macOS,variant=Mac Catalyst" -archivePath archive/macOS-Catalyst BUILD_LIBRARY_FOR_DISTRIBUTION=YES SKIP_INSTALL=NO

xcodebuild -create-xcframework \
    -library archive/iOS.xcarchive/Products/usr/local/lib/libbon_fastmath.a \
    -headers archive/iOS.xcarchive/Products/usr/local/include \
    -library archive/iOS-Simulator.xcarchive/Products/usr/local/lib/libbon_fastmath.a \
    -headers archive/iOS-Simulator.xcarchive/Products/usr/local/include \
    -output bon_fastmath.xcframework

#    -framework archive/tvOS.xcarchive/Products/Library/Frameworks/example.framework \
#    -framework archive/tvOS-Simulator.xcarchive/Products/Library/Frameworks/example.framework \
#    -framework archive/watchOS.xcarchive/Products/Library/Frameworks/example.framework \
#    -framework archive/watchOS-Simulator.xcarchive/Products/Library/Frameworks/example.framework \
#    -framework archive/macOS.xcarchive/Products/Library/Frameworks/example.framework \
#    -framework archive/macOS-Catalyst.xcarchive/Products/Library/Frameworks/example.framework

# Package the xcframework into a zip file
zip -r fastmath.zip fastmath.xcframework

# Compute the checksum for the zip that can be used in a Package.swift file. This value is just printed to the output.
# The command needs to run in the directory where Package.swift is for some reason.
pushd ..
swift package compute-checksum fastmath/fastmath.xcframework.zip
popd
