#
# Be sure to run `pod lib lint UnsupportedOSVersionAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UnsupportedOSVersionAlert'
  s.version          = '0.1.0'
  s.summary          = 'Alert your users if they use an unsupported iOS version with your app'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'UnsupportedOSVersionAlert is a light-weight and handy plugin that helps you inform users of unsupported iOS versions (such as iOS betas)'

  s.homepage         = 'https://github.com/caloon/UnsupportedOSVersionAlert'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'caloon' => 'me@josefmoser.de' }
  s.source           = { :git => 'https://github.com/caloon/UnsupportedOSVersionAlert.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/josef_moser'

  s.ios.deployment_target = '8.0'

  s.source_files = 'UnsupportedOSVersionAlert/Classes/**/*'

  # s.resource_bundles = {
  #   'UnsupportedOSVersionAlert' => ['UnsupportedOSVersionAlert/Assets/*.png']
  # }

end
