Pod::Spec.new do |s|
  s.name             = 'MBTips'
  s.version          = '1.1'
  s.summary          = 'APP 内顶部信息提示'

  #添加第三方依赖
  s.dependency 'QMUIKit'

  s.description      = <<-DESC
APP 内用到的顶部用户提示。1.更改库最底目标库版本号为9.1
                       DESC

  s.homepage         = 'https://github.com/titer18/MBTips'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'titer' => 'zhaohong1991@hotmail.com' }
  s.source           = { :git => 'https://github.com/titer18/MBTips.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.1'

  s.source_files = 'MBTips/Classes/**/*.{h,m}'
  s.public_header_files = 'MBTips/Classes/**/*.h'

end
