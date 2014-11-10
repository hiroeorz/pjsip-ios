#!/bin/sh

# see http://stackoverflow.com/a/3915420/318790
function realpath { echo $(cd $(dirname "$1"); pwd)/$(basename "$1"); }

BUILD_DIR=$(realpath "build")
if [ ! -d ${BUILD_DIR} ]; then
    mkdir ${BUILD_DIR}
fi

PJSIP_URL="http://www.pjsip.org/release/2.3/pjproject-2.3.tar.bz2"
PJSIP_ARCHIVE=${BUILD_DIR}/`basename ${PJSIP_URL}`
OPENSSL_URL="https://raw.githubusercontent.com/x2on/OpenSSL-for-iPhone/master/build-libssl.sh"
OPENSSL_DIR=${BUILD_DIR}/openssl
OPENSSL_SH=${OPENSSL_DIR}/`basename ${OPENSSL_DIR}`

copy_libs () {
    DST=${1}

    if [ -d pjlib/lib-${DST}/ ]; then
        rm -rf pjlib/lib-${DST}/
    fi
    if [ ! -d pjlib/lib-${DST}/ ]; then
        mkdir pjlib/lib-${DST}/
    fi
    cp pjlib/lib/libpj-arm-apple-darwin9.a pjlib/lib-${DST}/libpj-arm-apple-darwin9.a

    if [ -d pjlib-util/lib-${DST}/ ]; then
        rm -rf pjlib-util/lib-${DST}/
    fi
    if [ ! -d pjlib-util/lib-${DST}/ ]; then
        mkdir pjlib-util/lib-${DST}/
    fi
    cp pjlib-util/lib/libpjlib-util-arm-apple-darwin9.a pjlib-util/lib-${DST}/libpjlib-util-arm-apple-darwin9.a

    if [ -d pjmedia/lib-${DST}/ ]; then
        rm -rf pjmedia/lib-${DST}/
    fi
    if [ ! -d pjmedia/lib-${DST}/ ]; then
        mkdir pjmedia/lib-${DST}/
    fi
    cp pjmedia/lib/libpjmedia-arm-apple-darwin9.a pjmedia/lib-${DST}/libpjmedia-arm-apple-darwin9.a
    cp pjmedia/lib/libpjmedia-audiodev-arm-apple-darwin9.a pjmedia/lib-${DST}/libpjmedia-audiodev-arm-apple-darwin9.a
    cp pjmedia/lib/libpjmedia-codec-arm-apple-darwin9.a pjmedia/lib-${DST}/libpjmedia-codec-arm-apple-darwin9.a
    cp pjmedia/lib/libpjmedia-videodev-arm-apple-darwin9.a pjmedia/lib-${DST}/libpjmedia-videodev-arm-apple-darwin9.a
    cp pjmedia/lib/libpjsdp-arm-apple-darwin9.a pjmedia/lib-${DST}/libpjsdp-arm-apple-darwin9.a

    if [ -d pjnath/lib-${DST}/ ]; then
        rm -rf pjnath/lib-${DST}/
    fi
    if [ ! -d pjnath/lib-${DST}/ ]; then
        mkdir pjnath/lib-${DST}/
    fi
    cp pjnath/lib/libpjnath-arm-apple-darwin9.a pjnath/lib-${DST}/libpjnath-arm-apple-darwin9.a

    if [ -d pjsip/lib-${DST}/ ]; then
        rm -rf pjsip/lib-${DST}/
    fi
    if [ ! -d pjsip/lib-${DST}/ ]; then
        mkdir pjsip/lib-${DST}/
    fi
    cp pjsip/lib/libpjsip-arm-apple-darwin9.a pjsip/lib-${DST}/libpjsip-arm-apple-darwin9.a
    cp pjsip/lib/libpjsip-simple-arm-apple-darwin9.a pjsip/lib-${DST}/libpjsip-simple-arm-apple-darwin9.a
    cp pjsip/lib/libpjsip-ua-arm-apple-darwin9.a pjsip/lib-${DST}/libpjsip-ua-arm-apple-darwin9.a
    cp pjsip/lib/libpjsua-arm-apple-darwin9.a pjsip/lib-${DST}/libpjsua-arm-apple-darwin9.a
    cp pjsip/lib/libpjsua2-arm-apple-darwin9.a pjsip/lib-${DST}/libpjsua2-arm-apple-darwin9.a

    if [ -d third_party/lib-${DST}/ ]; then
        rm -rf third_party/lib-${DST}/
    fi
    if [ ! -d third_party/lib-${DST}/ ]; then
        mkdir third_party/lib-${DST}/
    fi
    cp third_party/lib/libg7221codec-arm-apple-darwin9.a third_party/lib-${DST}/libg7221codec-arm-apple-darwin9.a
    cp third_party/lib/libgsmcodec-arm-apple-darwin9.a third_party/lib-${DST}/libgsmcodec-arm-apple-darwin9.a
    cp third_party/lib/libilbccodec-arm-apple-darwin9.a third_party/lib-${DST}/libilbccodec-arm-apple-darwin9.a
    cp third_party/lib/libresample-arm-apple-darwin9.a third_party/lib-${DST}/libresample-arm-apple-darwin9.a
    cp third_party/lib/libspeex-arm-apple-darwin9.a third_party/lib-${DST}/libspeex-arm-apple-darwin9.a
    cp third_party/lib/libsrtp-arm-apple-darwin9.a third_party/lib-${DST}/libsrtp-arm-apple-darwin9.a
}

lipo_libs () {
xcrun -sdk iphoneos lipo -arch armv7  pjlib/lib-armv7/libpj-arm-apple-darwin9.a \
                         -arch armv7s pjlib/lib-armv7s/libpj-arm-apple-darwin9.a \
                         -arch arm64  pjlib/lib-arm64/libpj-arm-apple-darwin9.a \
                         -create -output lib/libpj-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjlib-util/lib-armv7/libpjlib-util-arm-apple-darwin9.a \
                         -arch armv7s pjlib-util/lib-armv7s/libpjlib-util-arm-apple-darwin9.a \
                         -arch arm64  pjlib-util/lib-arm64/libpjlib-util-arm-apple-darwin9.a \
                         -create -output lib/libpjlib-util-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjmedia/lib-armv7/libpjmedia-arm-apple-darwin9.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-arm-apple-darwin9.a \
                         -arch arm64  pjmedia/lib-arm64/libpjmedia-arm-apple-darwin9.a \
                         -create -output lib/libpjmedia-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjmedia/lib-armv7/libpjmedia-audiodev-arm-apple-darwin9.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-audiodev-arm-apple-darwin9.a \
                         -arch arm64  pjmedia/lib-arm64/libpjmedia-audiodev-arm-apple-darwin9.a \
                         -create -output lib/libpjmedia-audiodev-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjmedia/lib-armv7/libpjmedia-codec-arm-apple-darwin9.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-codec-arm-apple-darwin9.a \
                         -arch arm64  pjmedia/lib-arm64/libpjmedia-codec-arm-apple-darwin9.a \
                         -create -output lib/libpjmedia-codec-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjmedia/lib-armv7/libpjmedia-videodev-arm-apple-darwin9.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjmedia-videodev-arm-apple-darwin9.a \
                         -arch arm64 pjmedia/lib-arm64/libpjmedia-videodev-arm-apple-darwin9.a \
                         -create -output lib/libpjmedia-videodev-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjmedia/lib-armv7/libpjsdp-arm-apple-darwin9.a \
                         -arch armv7s pjmedia/lib-armv7s/libpjsdp-arm-apple-darwin9.a \
                         -arch arm64  pjmedia/lib-arm64/libpjsdp-arm-apple-darwin9.a \
                         -create -output lib/libpjsdp-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjnath/lib-armv7/libpjnath-arm-apple-darwin9.a \
                         -arch armv7s pjnath/lib-armv7s/libpjnath-arm-apple-darwin9.a \
                         -arch arm64  pjnath/lib-arm64/libpjnath-arm-apple-darwin9.a \
                         -create -output lib/libpjnath-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjsip/lib-armv7/libpjsip-arm-apple-darwin9.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsip-arm-apple-darwin9.a \
                         -arch arm64 pjsip/lib-arm64/libpjsip-arm-apple-darwin9.a \
                         -create -output lib/libpjsip-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjsip/lib-armv7/libpjsip-simple-arm-apple-darwin9.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsip-simple-arm-apple-darwin9.a \
                         -arch arm64  pjsip/lib-arm64/libpjsip-simple-arm-apple-darwin9.a \
                         -create -output lib/libpjsip-simple-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjsip/lib-armv7/libpjsip-ua-arm-apple-darwin9.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsip-ua-arm-apple-darwin9.a \
                         -arch arm64  pjsip/lib-arm64/libpjsip-ua-arm-apple-darwin9.a \
                         -create -output lib/libpjsip-ua-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjsip/lib-armv7/libpjsua-arm-apple-darwin9.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsua-arm-apple-darwin9.a \
                         -arch arm64  pjsip/lib-arm64/libpjsua-arm-apple-darwin9.a \
                         -create -output lib/libpjsua-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  pjsip/lib-armv7/libpjsua2-arm-apple-darwin9.a \
                         -arch armv7s pjsip/lib-armv7s/libpjsua2-arm-apple-darwin9.a \
                         -arch arm64  pjsip/lib-arm64/libpjsua2-arm-apple-darwin9.a \
                         -create -output lib/libpjsua2-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  third_party/lib-armv7/libg7221codec-arm-apple-darwin9.a \
                         -arch armv7s third_party/lib-armv7s/libg7221codec-arm-apple-darwin9.a \
                         -arch arm64  third_party/lib-arm64/libg7221codec-arm-apple-darwin9.a \
                         -create -output lib/libg7221codec-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  third_party/lib-armv7/libgsmcodec-arm-apple-darwin9.a \
                         -arch armv7s third_party/lib-armv7s/libgsmcodec-arm-apple-darwin9.a \
                         -arch arm64  third_party/lib-arm64/libgsmcodec-arm-apple-darwin9.a \
                         -create -output lib/libgsmcodec-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  third_party/lib-armv7/libilbccodec-arm-apple-darwin9.a \
                         -arch armv7s third_party/lib-armv7s/libilbccodec-arm-apple-darwin9.a \
                         -arch arm64  third_party/lib-arm64/libilbccodec-arm-apple-darwin9.a \
                         -create -output lib/libilbccodec-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  third_party/lib-armv7/libresample-arm-apple-darwin9.a \
                         -arch armv7s third_party/lib-armv7s/libresample-arm-apple-darwin9.a \
                         -arch arm64  third_party/lib-arm64/libresample-arm-apple-darwin9.a \
                         -create -output lib/libresample-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  third_party/lib-armv7/libspeex-arm-apple-darwin9.a \
                         -arch armv7s third_party/lib-armv7s/libspeex-arm-apple-darwin9.a \
                         -arch arm64 third_party/lib-arm64/libspeex-arm-apple-darwin9.a \
                         -create -output lib/libspeex-arm-apple-darwin9.a

xcrun -sdk iphoneos lipo -arch armv7  third_party/lib-armv7/libsrtp-arm-apple-darwin9.a \
                         -arch armv7s third_party/lib-armv7s/libsrtp-arm-apple-darwin9.a \
                         -arch arm64 third_party/lib-arm64/libsrtp-arm-apple-darwin9.a \
                         -create -output lib/libsrtp-arm-apple-darwin9.a
}


if [ ! -f ${OPENSSL_SH} ]; then
    echo "Downloading openssl..."
    curl -# --create-dirs -o ${OPENSSL_SH} ${OPENSSL_URL}
fi

if [ ! -f "${OPENSSL_DIR}/lib/libssl.a" ]; then
    pushd . > /dev/null
    cd ${OPENSSL_DIR}
    /bin/sh ${OPENSSL_SH}
    popd > /dev/null
fi

if [ ! -f ${PJSIP_ARCHIVE} ]; then
  echo "Downloading pjsip..."
  curl -# -o ${PJSIP_ARCHIVE} ${PJSIP_URL}
fi

PJSIP_NAME=`tar tzf ${PJSIP_ARCHIVE} | sed -e 's@/.*@@' | uniq`
PJSIP_DIR=${BUILD_DIR}/${PJSIP_NAME}
echo "Using ${PJSIP_NAME}..."

if [ -d ${PJSIP_DIR} ]; then
    echo "Cleaning up..."
    rm -rf ${PJSIP_DIR}
fi

echo "Unarchiving..."
pushd . > /dev/null
cd ${BUILD_DIR}
tar -xf ${PJSIP_ARCHIVE}
popd > /dev/null

echo "Creating config.h..."
echo "#define PJ_CONFIG_IPHONE 1
#define PJMEDIA_HAS_VIDEO 1
#define PJMEDIA_HAS_OPENH264_CODEC 1
// fix for xcode6
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#include <pj/config_site_sample.h>" > ${PJSIP_DIR}/pjlib/include/pj/config_site.h

# export CFLAGS="-Wno-unused-label -I${OPENSSL_DIR}/include"
# export LDFLAGS="-L${OPENSSL_DIR}/lib"
# configure="./configure-iphone --with-ssl=${OPENSSL_DIR}"

export CFLAGS="-Wno-unused-label -I/tmp/openh264-ios/include"
#configure="./configure-iphone"
configure_ios_32="./configure-iphone --with-libyuv=/tmp/libyuv --with-openh264=/tmp/openh264-ios"
configure_ios_64="./configure-iphone --with-libyuv=/tmp/libyuv --with-openh264=/tmp/openh264-ios"

cd ${PJSIP_DIR}

echo "Building for armv7..."
make distclean > /dev/null 2>&1
ARCH="-arch armv7" \
$configure_ios_32 > /dev/null
make dep > /dev/null
make clean > /dev/null
make > /dev/null 2>&1
copy_libs armv7

echo "Building for armv7s..."
make distclean > /dev/null
ARCH='-arch armv7s' \
$configure_ios_32 > /dev/null
make dep > /dev/null
make clean > /dev/null
make > /dev/null 2>&1
copy_libs armv7s

echo "Building for arm64..."
make distclean #> /dev/null
ARCH='-arch arm64' \
$configure_ios_64 #> /dev/null
make dep > /dev/null
make clean > /dev/null
make > /dev/null 2>&1
copy_libs arm64

echo "Making universal lib..."
make distclean > /dev/null
lipo_libs
exit 0

echo "Building for iPhoneSimulator (i386)..."
make distclean > /dev/null
DEVPATH=/Applications/XCode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/ \
ARCH="-arch i386" \
CFLAGS="$CFLAGS -O2 -m32 -mios-simulator-version-min=5.0" LDFLAGS="$CFLAGS -O2 -m32 -mios-simulator-version-min=5.0" \
$configure_i386 > /dev/null
make dep > /dev/null
make clean > /dev/null
make > /dev/null 2>&1
copy_libs iPhoneSimulator32

echo "Building for iPhoneSimulator (x86_64)..."
make distclean > /dev/null
DEVPATH=/Applications/XCode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/ \
ARCH="-arch x86_64" \
CFLAGS="$CFLAGS -O2 -mios-simulator-version-min=5.0" LDFLAGS="$CFLAGS -O2 -mios-simulator-version-min=5.0" \
$configure_x86_64 > /dev/null
make dep > /dev/null
make clean > /dev/null
make > /dev/null 2>&1
copy_libs iPhoneSimulator64

echo "Making universal lib..."
make distclean > /dev/null
lipo_libs

echo "Done"
