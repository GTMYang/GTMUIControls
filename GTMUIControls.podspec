Pod::Spec.new do |s|

  s.name         = "GTMUIControls"
  s.version      = "0.1"
  s.summary      = "swift 封装的一些UI小控件"

  s.homepage     = "https://github.com/GTMYang/GTMUIControls"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GTMYang" => "17757128523@163.com" }


  s.source       = { :git => "https://github.com/GTMYang/GTMUIControls.git", :tag => s.version }
  s.source_files = 'GTMUIControls/*.{h,swift}'

  s.ios.deployment_target = '8.0'
  s.frameworks = 'UIKit','Foundation'

  s.dependency 'SnapKit'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
