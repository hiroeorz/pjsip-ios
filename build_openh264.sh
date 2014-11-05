#!/bin/sh

OPENH264_URL=https://github.com/cisco/openh264/archive/v1.0.0.tar.gz

# see http://stackoverflow.com/a/3915420/318790
function realpath { echo $(cd $(dirname "$1"); pwd)/$(basename "$1"); }

BUILD_DIR=$(realpath "build")
if [ ! -d ${BUILD_DIR} ]; then
    mkdir ${BUILD_DIR}
fi

cd $BUILD_DIR
wget $OPENH264_URL -O openh264.tar.gz
tar xvzf openh264.tar.gz

cd openh264-1.0.0/

OPTS="OS=ios PREFIX=/tmp/openh264-ios"
make $OPTS clean
make $OPTS
make $OPTS install

OPTS="OS=ios ARCH=arm64 PREFIX=/tmp/openh264-ios-arm64"
make $OPTS clean
make $OPTS
make $OPTS install
