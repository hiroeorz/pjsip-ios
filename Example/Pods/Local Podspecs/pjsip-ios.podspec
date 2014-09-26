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
  # s.header_mappings_dir = 'Pod'

  s.frameworks = 'CFNetwork', 'AudioToolbox', 'AVFoundation'
  s.public_header_files = 'Pod/pjlib/include/**', 'Pod/pjlib-util/include/**', 'Pod/pjmedia/include/**', 'Pod/pjnath/include/**', 'Pod/pjsip/include/**'
  s.vendored_libraries = 'Pod/pjlib/lib/*.a', 'Pod/pjlib-util/lib/*.a', 'Pod/pjmedia/lib/*.a', 'Pod/pjnath/lib/*.a', 'Pod/pjsip/lib/*.a', 'Pod/third_party/lib/*.a'

  s.subspec 'pj' do |ss|
      
      ss.header_dir = 'pj'
      ss.frameworks = 'CFNetwork'
      ss.public_header_files = 'Pod/pjlib/include/pj/**'
      ss.vendored_libraries = 'Pod/pjlib/lib/*.a'

      ss.subspec 'compat' do |sss|
        
        sss.header_dir = 'pj/compat'
        sss.frameworks = 'CFNetwork'
        sss.public_header_files = 'Pod/pjlib/include/pj/compat/**'
        sss.vendored_libraries = 'Pod/pjlib/lib/*.a'
      
       end

  end

  s.subspec 'pj++' do |sss|
     
    sss.header_dir = 'pj++'
    sss.frameworks = 'CFNetwork'
    sss.public_header_files = 'Pod/pjlib/include/pj++/**'
    sss.vendored_libraries = 'Pod/pjlib/lib/*.a'
    
  end

  s.subspec 'pjlib-util' do |ss|
     
      ss.header_dir = 'pjlib-util'
      ss.public_header_files = 'Pod/pjlib-util/include/pjlib-util/**'
      ss.vendored_libraries = 'Pod/pjlib-util/lib/*.a'

  end


  s.subspec 'pjmedia' do |ss|
     
      ss.header_dir = 'pjmedia'
      ss.frameworks = 'AudioToolbox', 'AVFoundation'
      ss.public_header_files = 'Pod/pjmedia/include/pjmedia/**'
      ss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
    end

  s.subspec 'pjmedia-audiodev' do |ss|
     
    ss.header_dir = 'pjmedia-audiodev'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/pjmedia/include/pjmedia-audiodev/**'
    ss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
  end

  s.subspec 'pjmedia-codec' do |ss|
     
    ss.header_dir = 'pjmedia-codec'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/pjmedia/include/pjmedia-codec/**'
    ss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
  end

  s.subspec 'pjmedia-videodev' do |ss|
     
    ss.header_dir = 'pjmedia-videodev'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/pjmedia/include/pjmedia-videodev/**'
    ss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
  end

  s.subspec 'pjnath' do |ss|
     
    ss.header_dir = 'pjnath'
    ss.public_header_files = 'Pod/pjnath/include/pjnath/**'
    ss.vendored_libraries = 'Pod/pjnath/lib/*.a'
  
  end

  s.subspec 'pjsip' do |ss|
      
    ss.header_dir = 'pjsip'
    ss.public_header_files = 'Pod/pjsip/include/pjsip/**'
    ss.vendored_libraries = 'Pod/pjsip/lib/*.a'
  
  end

  s.subspec 'pjsip-simple' do |ss|
     
    ss.header_dir = 'pjsip-simple'
    ss.public_header_files = 'Pod/pjsip/include/pjsip-simple/**'
    ss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
  end

  s.subspec 'pjsip-ua' do |ss|
      
    ss.header_dir = 'pjsip-ua'
    ss.public_header_files = 'Pod/pjsip/include/pjsip-ua/**'
    ss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
  end

  s.subspec 'pjsua-lib' do |ss|
      
    ss.header_dir = 'pjsua-lib'
    ss.public_header_files = 'Pod/pjsip/include/pjsua-lib/**'
    ss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
  end

  s.subspec 'pjsua2' do |ss|
     
    ss.header_dir = 'pjsua2'
    ss.public_header_files = 'Pod/pjsip/include/pjsua2/**'
    ss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
  end

end