#define PJ_CONFIG_IPHONE 1
#define PJMEDIA_HAS_VIDEO 1
#define PJMEDIA_HAS_OPENH264_CODEC 1
#define PJMEDIA_VIDEO_DEV_HAS_IOS_OPENGL 1
// fix for xcode6
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#include <pj/config_site_sample.h>
