#
# Be sure to run `pod lib lint Swimediator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name             = 'Swimediator'
  s.version          = '0.1.0'
  s.summary          = 'A swifty mediator for iOS.'
  
  s.description      = <<-DESC
  A swifty mediator for iOS by using injection dependency and router
                       DESC

  s.homepage         = 'https://github.com/leo-iOS/Swimediator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'leo' => '199320701@qq.com' }
  s.source           = { :git => 'https://github.com/leo-iOS/Swimediator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'Swimediator/**/*'

end
