
Pod::Spec.new do |s|

  s.name         = "JSTestProject"
  s.version      = "0.0.1"
  s.summary      = "A short description of JSTestProject."

  s.description  = <<-DESC
       一个自定义的emojiView
                   DESC

  s.homepage     = "https://github.com/lmg4819/JSTestProject"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "luomengge" => "893788253@qq.com" }

  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/lmg4819/JSTestProject.git", :tag => "#{s.version}" }

  s.source_files  = "EmojiTool/EmojiView/*", "EmojiTool/**/*.{h,m}"

  s.requires_arc = true

end
