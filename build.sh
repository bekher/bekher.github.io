#!/bin/bash
BUILD_DIR=build

if [ -d $BUILD_DIR ]; then
    echo "removing existing build directory"
    rm -rf $BUILD_DIR
fi

mkdir $BUILD_DIR
cp index.html $BUILD_DIR/.
cp -R *.pdf $BUILD_DIR/.
cp -R js $BUILD_DIR/.
cp -R img $BUILD_DIR/.
cp -R css $BUILD_DIR/.
cp -R fonts $BUILD_DIR/.

echo "bekher.net build complete"
