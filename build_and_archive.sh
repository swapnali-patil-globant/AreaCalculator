#!/bin/bash

# Variables
SCHEME_NAME="AreaCalculator"
ARCHIVE_PATH="$HOME/Desktop"

#first go the project folder to run this script
#cd "your_framework_path"

# Create the archive for device
echo "Archiving for device..."

xcodebuild archive \
-scheme "$SCHEME_NAME" \
-destination "generic/platform=iOS" \
-archivePath "$ARCHIVE_PATH/output/$SCHEME_NAME" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES
                   
if [ $? -ne 0 ]; then
    echo "Archive failed."
    exit 1
fi

echo "Device Archive created successfully at $ARCHIVE_PATH"

# Create the archive for simulator
echo "Archiving for simulator..."

xcodebuild archive \
-scheme "$SCHEME_NAME" \
-destination "generic/platform=iOS Simulator" \
-archivePath "$ARCHIVE_PATH/output/$SCHEME_NAME-Sim" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

if [ $? -ne 0 ]; then
    echo "Archive failed."
    exit 1
fi

echo "Simulator Archive created successfully at $ARCHIVE_PATH"

cd "$ARCHIVE_PATH/output"

xcodebuild -create-xcframework \
-framework "./$SCHEME_NAME.xcarchive/Products/Library/Frameworks/$SCHEME_NAME.framework" \
-framework "./$SCHEME_NAME-Sim.xcarchive/Products/Library/Frameworks/$SCHEME_NAME.framework" \
-output "./$SCHEME_NAME.xcframework"

if [ $? -ne 0 ]; then
    echo "XCArchive failed."
    exit 1
fi

echo "XCArchive created successfully at $ARCHIVE_PATH"
