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
  
  s.public_header_files = 'Pod/Headers/**/**/*'

  s.preserve_paths      = 'Pod/Headers/**/*'

  s.vendored_libraries  = 'Pod/Lib/**/*'

  # header_search_paths   = '"$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjsip/include"',
  #                         '"$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjlib/include"',
  #                         '"$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjlib-util/include"',
  #                         '"$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjnath/include"',
  #                         '"$(PODS_ROOT)/pjsip/build/pjproject-2.3/pjmedia/include"'

  s.xcconfig            = {
                           'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1'}

  # s.dependency          'OpenSSL-Universal', '1.0.1.i'
  s.frameworks          = 'CFNetwork', 'AudioToolbox', 'AVFoundation'
  s.header_mappings_dir = 'Pod/Headers'
  s.requires_arc        = false
end