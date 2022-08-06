Pod::Spec.new do |s|
  s.name             = 'LocalDataViewer'
  s.version          = '1.0.1'
  s.summary          = 'An debug helper show local data as UserDefaults or Keychain'
  s.homepage         = 'https://github.com/manhpham90vn/LocalDataViewer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'manhpham90vn' => 'manhpham90vn@icloud.com' }
  s.source           = { :git => 'https://github.com/manhpham90vn/LocalDataViewer.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'LocalDataViewer/*.{h,swift,xib,storyboard}'
  s.swift_version = '5.0'
  s.dependency 'KeychainAccess'
end
