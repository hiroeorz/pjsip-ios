#!/bin/sh

# see http://stackoverflow.com/a/3915420/318790
function realpath { echo $(cd $(dirname "$1"); pwd)/$(basename "$1"); }

BUILD_DIR=$(realpath "build")
if [ ! -d ${BUILD_DIR} ]; then
    mkdir ${BUILD_DIR}
fi

LIBYUV_DIR=${BUILD_DIR}/libyuv

mkdir -p $LIBYUV_DIR
cd $LIBYUV_DIR
gclient config http://libyuv.googlecode.com/svn/trunk
echo "target_os=['ios'];" >> .gclient
echo "target_os_only = True" >> .gclient
gclient sync

rm -rf trunk/third_party/libjpeg_turbo 
cp -a trunk/third_party/libjpeg trunk/third_party/libjpeg_turbo

cd trunk
echo "{ 'GYP_DEFINES': 'OS=ios', 'GYP_GENERATOR_FLAGS': 'xcode_project_version=3.2', }" > chromium.gyp_env
gclient runhooks

sudo rm -rf /tmp/libyuv32
sudo rm -rf /tmp/libyuv64
sudo rm -rf out_ios

# ios armv7
GYP_DEFINES="OS=ios target_arch=armv7" GYP_CROSSCOMPILE=1 GYP_GENERATOR_FLAGS="output_dir=out_ios" ./gyp_libyuv -f ninja --depth=. libyuv_test.gyp
ninja -j7 -C out_ios/Debug-iphoneos libyuv_unittest
ninja -j7 -C out_ios/Release-iphoneos libyuv_unittest
cp -a ../trunk /tmp/libyuv32

sudo rm -rf out_ios

# ios arm64
GYP_DEFINES="OS=ios target_arch=armv7 target_subarch=64" GYP_CROSSCOMPILE=1 GYP_GENERATOR_FLAGS="output_dir=out_ios" ./gyp_libyuv -f ninja --depth=. libyuv_test.gyp
ninja -j7 -C out_ios/Debug-iphoneos libyuv_unittest
ninja -j7 -C out_ios/Release-iphoneos libyuv_unittest
cp -a ../trunk /tmp/libyuv64

