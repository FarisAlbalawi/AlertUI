#
# Be sure to run `pod lib lint AlertUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AlertUI'
  s.version          = '0.1.0'
  s.swift_version    = '5'
  s.summary          = 'Awesome AlertUI'

  
    s.description      = <<-DESC
    'Advanced of Alert with Image, Icons, Title, Messages, Buttons, and awesome design.'.
        DESC

  s.homepage         = 'https://github.com/FarisAlbalawi/AlertUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Faris Albalawi' => 'developer.faris@gmail.com' }
  s.source           = { :git => 'https://github.com/FarisAlbalawi/AlertUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'AlertUI/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'AlertUI' => ['AlertUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
