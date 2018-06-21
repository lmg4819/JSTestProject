
Pod::Spec.new do |s|


  s.name         = "JSTestProject"
  s.version      = "0.0.2"
  s.summary      = "JSTestProject is a custom emoji View"


  s.description  = <<-DESC
        一个自定的emoji表情View，可以自定义键盘使用
                   DESC

  s.homepage     = "https://github.com/lmg4819/JSEmojiView"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "luomengge" => "luomengge@cheyipai.com" }


  #  When using multiple platforms
  s.ios.deployment_target = "9.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"




  s.source       = { :git => "https://github.com/lmg4819/JSTestProject.git", :tag => "#{s.version}" }

  s.source_files  = "EmojiTool", "EmojiTool/**/*.{h,m}"
  #  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "EmojiTool/**/*.h"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
