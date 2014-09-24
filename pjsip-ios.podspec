#
# Be sure to run `pod lib lint pjsip-ios.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "pjsip-ios"
  s.version          = "0.1.1"
  s.summary          = "PJSIP for ios"
  s.description      = <<-DESC
                       Other pods for pjsip were just not in a stable state. So I am creating a new one.
                       DESC
  s.homepage         = "https://github.com/petester42/pjsip-ios.git"
  s.license          = 'MIT'
  s.author           = { "Pierre-Marc Airoldi" => "pierremarcairoldi@gmail.com" }
  s.source           = { :git => "https://github.com/petester42/pjsip-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/petester42'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  # s.public_header_files = 'Pod/pjsip-include/**'
  
  # s.preserve_paths = 'Pod/pjsip-include/**/**/*{h,hpp}', 'Pod/pjsip-lib/*.a'
  
  # s.libraries = 'g7221codec-arm-apple-darwin9', 'gsmcodec-arm-apple-darwin9', 'ilbccodec-arm-apple-darwin9', 'pj-arm-apple-darwin9', 'pjlib-util-arm-apple-darwin9', 'pjmedia-arm-apple-darwin9', 'pjmedia-audiodev-arm-apple-darwin9', 'pjmedia-codec-arm-apple-darwin9', 'pjmedia-videodev-arm-apple-darwin9', 'pjnath-arm-apple-darwin9', 'pjsip-arm-apple-darwin9', 'pjsip-simple-arm-apple-darwin9', 'pjsip-ua-arm-apple-darwin9', 'pjsua-arm-apple-darwin9', 'pjsua2-arm-apple-darwin9', 'resample-arm-apple-darwin9', 'speex-arm-apple-darwin9', 'srtp-arm-apple-darwin9'

  # s.frameworks = 'CFNetwork', 'AudioToolbox', 'AVFoundation'

  # s.header_mappings_dir = 'Pod'

  s.subspec 'pjlib' do |pjlib|

    pjlib.header_dir = 'pjlib'
    pjlib.frameworks = 'CFNetwork'
    pjlib.public_header_files = 'Pod/pjlib/include/*{h, hpp}'
    pjlib.vendored_libraries = 'Pod/pjlib/lib/*.a' # the libraries for this component

      pjlib.subspec 'pjlibpj' do |pjlibpj|
        pjlibpj.header_dir = 'pjlib/pj'
        pjlibpj.public_header_files = 'Pod/pjlib/include/pj/**/*{h, hpp}'
      end
  end

  # s.subspec 'pjlib' do |sub|
  #   sub.public_header_files = 'build/pjproject-2.3/pjlib/include/**'
  #   sub.preserve_paths      = 'build/pjproject-2.3/pjlib/include/**/*.h', 'build/pjproject-2.3/pjlib/lib/*.a'
  #   sub.frameworks = 'CFNetwork'
  #   sub.libraries           = 'pj-arm-apple-darwin9'
  #   sub.xcconfig            = {
  #     'HEADER_SEARCH_PATHS'  => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjlib/include',
  #     'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjlib/lib'
  #   }
  # end

  # s.subspec 'pjlib_util' do |sub|
  #   sub.public_header_files = 'build/pjproject-2.3/pjlib-util/include/**'
  #   sub.preserve_paths      = 'build/pjproject-2.3/pjlib-util/include/**/*.h', 'build/pjproject-2.3/pjlib-util/lib/*.a'
  #   sub.libraries           = 'pjlib-util-arm-apple-darwin9'
  #   sub.xcconfig            = {
  #     'HEADER_SEARCH_PATHS'  => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjlib-util/include',
  #     'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjlib-util/lib'
  #   }
  # end

  # s.subspec 'pjnath' do |sub|
  #   sub.public_header_files = 'build/pjproject-2.3/pjnath/include/**'
  #   sub.preserve_paths      = 'build/pjproject-2.3/pjnath/include/**/*.h', 'build/pjproject-2.3/pjnath/lib/*.a'
  #   sub.libraries           = 'pjnath-arm-apple-darwin9'
  #   sub.xcconfig            = {
  #     'HEADER_SEARCH_PATHS'  => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjnath/include',
  #     'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjnath/lib'
  #   }
  # end

  # s.subspec 'pjmedia' do |sub|
  #   sub.public_header_files = 'build/pjproject-2.3/pjmedia/include/**'
  #   sub.preserve_paths      = 'build/pjproject-2.3/pjmedia/include/**/*.h', 'build/pjproject-2.3/pjmedia/lib/*.a'
  #   sub.libraries           = 'pjmedia-arm-apple-darwin9', 'pjmedia-audiodev-arm-apple-darwin9', 'pjmedia-codec-arm-apple-darwin9', 'pjmedia-videodev-arm-apple-darwin9', 'pjsdp-arm-apple-darwin9'
  #   sub.frameworks          = 'AudioToolbox', 'AVFoundation'
  #   sub.xcconfig            = {
  #     'HEADER_SEARCH_PATHS'  => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjmedia/include',
  #     'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjmedia/lib'
  #   }
  # end

  # s.subspec 'third_party' do |sub|
  #   sub.preserve_paths      = 'build/pjproject-2.3/third_party/lib/*.a'
  #   sub.libraries           = 'g7221codec-arm-apple-darwin9', 'ilbccodec-arm-apple-darwin9', 'speex-arm-apple-darwin9', 'srtp-arm-apple-darwin9', 'gsmcodec-arm-apple-darwin9', 'resample-arm-apple-darwin9'
  #   sub.xcconfig            = {
  #     'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/pjsip/build/pjproject-2.3/third_party/lib'
  #   }
  # end

    s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1'
  }
end