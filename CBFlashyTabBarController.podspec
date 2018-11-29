Pod::Spec.new do |s|
  s.name             = 'CBFlashyTabBarController'
  s.version          = '0.8.0'
  s.summary          = 'One another nice animated tabbar'
  s.homepage         = 'https://github.com/Cuberto/flashy-tabbar'
  s.license          = 'MIT'
  s.author           = { 'askopin@gmail.com' =>  'askopin@gmail.com' }
  s.source           = { :git => 'https://github.com/Cuberto/flashy-tabbar.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.source_files = 'CBFlashyTabBarController/Classes/**/*'
end
