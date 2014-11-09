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

rm -rf /tmp/libyuv
rm -rf /tmp/libyuv_armv7
rm -rf /tmp/libyuv_armv7s
rm -rf /tmp/libyuv_arm64
rm -rf out_ios_armv7
rm -rf out_ios_armv7s
rm -rf out_ios_arm64

# ios armv7
#GYP_DEFINES="OS=ios target_arch=armv7" GYP_CROSSCOMPILE=1 GYP_GENERATOR_FLAGS="output_dir=out_ios_armv7" ./gyp_libyuv -f ninja --depth=. libyuv_test.gyp
#ninja -j7 -C out_ios_armv7/Debug-iphoneos libyuv_unittest
#ninja -j7 -C out_ios_armv7/Release-iphoneos libyuv_unittest
#rm -rf out_ios
#mv out_ios_armv7 out_ios
#cp -a ../trunk /tmp/libyuv_armv7

#GYP_DEFINES="OS=ios target_arch=armv7s" GYP_CROSSCOMPILE=1 GYP_GENERATOR_FLAGS="output_dir=out_ios_armv7s" ./gyp_libyuv -f ninja --depth=. libyuv_test.gyp
#ninja -j7 -C out_ios_armv7s/Debug-iphoneos libyuv_unittest
#ninja -j7 -C out_ios_armv7s/Release-iphoneos libyuv_unittest
#rm -rf out_ios
#mv out_ios_armv7s out_ios
#cp -a ../trunk /tmp/libyuv_armv7s

# ios arm64
#GYP_DEFINES="OS=ios target_arch=arm64" GYP_CROSSCOMPILE=1 GYP_GENERATOR_FLAGS="output_dir=out_ios_arm64" ./gyp_libyuv -f ninja --depth=. libyuv_test.gyp
#ninja -j7 -C out_ios_arm64/Debug-iphoneos libyuv_unittest
#ninja -j7 -C out_ios_arm64/Release-iphoneos libyuv_unittest
#rm -rf out_ios
#mv out_ios_arm64 out_ios
#cp -a ../trunk /tmp/libyuv_arm64

# ios
rm -rf out_ios
GYP_DEFINES="OS=ios target_arch=armv7 target_subarch=64" GYP_CROSSCOMPILE=1 GYP_GENERATOR_FLAGS="output_dir=out_ios" ./gyp_libyuv -f ninja --depth=. libyuv_test.gyp
=. libyuv_test.gyp
ninja -j7 -C out_ios/Debug-iphoneos libyuv_unittest
ninja -j7 -C out_ios/Release-iphoneos libyuv_unittest
mv out_ios_arm64 out_ios
cp -a ../trunk /tmp/libyuv

