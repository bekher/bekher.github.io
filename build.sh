#!/bin/bash

# Set to false if mklatex, xelatex and friends are not present
DO_CV_BUILD=false

BUILD_DIR=build
CV_DIR=cv-src
CV_URL=https://github.com/bekher/cv.git
CV_PDF_PATH=bekher-cv-ext.pdf
CV_BUILD_CMD=latexmk
CV_BUILD_ARGS="-xelatex CV.tex"

if [ -d $CV_DIR ]; then
    echo "removing existing resume source directory"
    rm -rf $CV_DIR
fi

git clone $CV_URL $CV_DIR

if [ $? -ne 0 ]; then
    echo "Error pulling CV source from ${CV_URL}"
    exit 1
fi

if [ "$DO_CV_BUILD" = true ]; then
    cd $CV_DIR/
    pwd
    rm CV.pdf
    $CV_BUILD_CMD $CV_BUILD_ARGS
    cd ..
fi

mv -f $CV_DIR/{CV.pdf,$CV_PDF_PATH}

if [ -d $BUILD_DIR ]; then
    echo "removing existing build directory"
    rm -rf $BUILD_DIR
fi

mkdir $BUILD_DIR

cp index.html $BUILD_DIR/.
cp -R js $BUILD_DIR/.
cp -R img $BUILD_DIR/.
cp -R css $BUILD_DIR/.
cp -R fonts $BUILD_DIR/.
cp $CV_DIR/$CV_PDF_PATH $BUILD_DIR/.

echo "bekher.net build complete"
