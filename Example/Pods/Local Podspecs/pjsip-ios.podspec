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

  s.subspec 'pjlib' do |ss|

    ss.header_dir = 'pjlib'
    ss.frameworks = 'CFNetwork'
    ss.public_header_files = 'Pod/pjlib/include/**'
    ss.vendored_libraries = 'Pod/pjlib/lib/*.a'

    ss.subspec 'pj' do |sss|
      
      sss.header_dir = 'pjlib/pj'
      sss.frameworks = 'CFNetwork'
      sss.public_header_files = 'Pod/pjlib/include/pj/**'
      sss.vendored_libraries = 'Pod/pjlib/lib/*.a'

      sss.subspec 'compat' do |ssss|
        
        ssss.header_dir = 'pjlib/pj/compat'
        ssss.frameworks = 'CFNetwork'
        ssss.public_header_files = 'Pod/pjlib/include/pj/compat/**'
        ssss.vendored_libraries = 'Pod/pjlib/lib/*.a'
      
      end

    end

    ss.subspec 'pj++' do |sss|
     
      sss.header_dir = 'pjlib/pj++'
      sss.frameworks = 'CFNetwork'
      sss.public_header_files = 'Pod/pjlib/include/pj++/**'
      sss.vendored_libraries = 'Pod/pjlib/lib/*.a'
    
    end

  end

  s.subspec 'pjlib-util' do |ss|

    ss.header_dir = 'pjlib-util'
    ss.public_header_files = 'Pod/pjlib-util/include/**'
    ss.vendored_libraries = 'Pod/pjlib-util/lib/*.a'
    
    ss.subspec 'pjlib-util' do |sss|
     
      sss.header_dir = 'pjlib-util/pjlib-util'
      sss.public_header_files = 'Pod/pjlib-util/include/pjlib-util/**'
      sss.vendored_libraries = 'Pod/pjlib-util/lib/*.a'
    
    end

  end

  s.subspec 'pjmedia' do |ss|

    ss.header_dir = 'pjmedia'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/pjmedia/include/**'
    ss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
    ss.subspec 'pjmedia' do |sss|
     
      sss.header_dir = 'pjmedia/pjmedia'
      sss.frameworks = 'AudioToolbox', 'AVFoundation'
      sss.public_header_files = 'Pod/pjmedia/include/pjmedia/**'
      sss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
    end

    ss.subspec 'pjmedia-audiodev' do |sss|
     
      sss.header_dir = 'pjmedia/pjmedia-audiodev'
      sss.frameworks = 'AudioToolbox', 'AVFoundation'
      sss.public_header_files = 'Pod/pjmedia/include/pjmedia-audiodev/**'
      sss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
    end

    ss.subspec 'pjmedia-codec' do |sss|
     
      sss.header_dir = 'pjmedia/pjmedia-codec'
      sss.frameworks = 'AudioToolbox', 'AVFoundation'
      sss.public_header_files = 'Pod/pjmedia/include/pjmedia-codec/**'
      sss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
    end

    ss.subspec 'pjmedia-videodev' do |sss|
     
      sss.header_dir = 'pjmedia/pjmedia-videodev'
      sss.frameworks = 'AudioToolbox', 'AVFoundation'
      sss.public_header_files = 'Pod/pjmedia/include/pjmedia-videodev/**'
      sss.vendored_libraries = 'Pod/pjmedia/lib/*.a'
    
    end

  end

  s.subspec 'pjnath' do |ss|

    ss.header_dir = 'pjnath'
    ss.public_header_files = 'Pod/pjnath/include/**'
    ss.vendored_libraries = 'Pod/pjnath/lib/*.a'
    
    ss.subspec 'pjnath' do |sss|
     
      sss.header_dir = 'pjnath/pjnath'
      sss.public_header_files = 'Pod/pjnath/include/pjnath/**'
      sss.vendored_libraries = 'Pod/pjnath/lib/*.a'
    
    end

  end

  s.subspec 'pjsip' do |ss|

    ss.header_dir = 'pjsip'
    ss.public_header_files = 'Pod/pjsip/include/**'
    ss.vendored_libraries = 'Pod/pjsip/lib/*.a'

    ss.subspec 'pjsip' do |sss|
      
      sss.header_dir = 'pjsip/pjsip'
      sss.public_header_files = 'Pod/pjsip/include/pjsip/**'
      sss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
    end

    ss.subspec 'pjsip-simple' do |sss|
     
      sss.header_dir = 'pjsip/pjsip-simple'
      sss.public_header_files = 'Pod/pjsip/include/pjsip-simple/**'
      sss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
    end

    ss.subspec 'pjsip-ua' do |sss|
      
      sss.header_dir = 'pjsip/pjsip-ua'
      sss.public_header_files = 'Pod/pjsip/include/pjsip-ua/**'
      sss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
    end

    ss.subspec 'pjsua-lib' do |sss|
      
      sss.header_dir = 'pjsip/pjsua-lib'
      sss.public_header_files = 'Pod/pjsip/include/pjsua-lib/**'
      sss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
    end

    ss.subspec 'pjsua2' do |sss|
     
      sss.header_dir = 'pjsip/pjsua2'
      sss.public_header_files = 'Pod/pjsip/include/pjsua2/**'
      sss.vendored_libraries = 'Pod/pjsip/lib/*.a'
    
    end

  end

  s.subspec 'third_party' do |ss|

    ss.header_dir = 'third_party'
    # ss.public_header_files = 'Pod/third_party/include/**'
    ss.vendored_libraries = 'Pod/third_party/lib/*.a'
    
  end

end