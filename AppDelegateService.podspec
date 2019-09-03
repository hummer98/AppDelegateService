#
# Be sure to run `pod lib lint AppDelegateService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppDelegateService'
  s.version          = '0.1.0'
  s.summary          = 'Quick setup for cloud servicies with AppDelegate'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/hummer98/AppDelegateService'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hummer98' => 'rr.yamamoto@gmail.com' }
  s.source           = { :git => 'https://github.com/hummer98/AppDelegateService.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hummer'

  s.ios.deployment_target = '10.0'

#  s.source_files = 'AppDelegateService/**/*'

  s.static_framework = true
  
  s.frameworks = 'UIKit'
  
  # AWS Extensions
  s.subspec 'Cognito' do |sp|
    sp.dependency 'AWSCognito'
    sp.source_files = 'Cognito/*.swift'
  end
  
  # Amplify Extensions
  s.subspec 'PushNotification' do |sp|
    sp.frameworks = 'UserNotifications'
    sp.source_files = 'PushNotification/*.swift'
  end

  # Firebase Extensions
  s.subspec 'Firebase' do |sp|
    sp.dependency 'Firebase'
    sp.source_files = 'Firebase/*.swift'
  end

  # s.resource_bundles = {
  #   'AppDelegateService' => ['AppDelegateService/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
