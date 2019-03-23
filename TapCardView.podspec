
Pod::Spec.new do |s|

  s.name         = "TapCardView"
  s.version      = "1.0.6"
  s.summary      = "UIView to detect a tap position."

  s.description  = <<-DESC
  UIView to detect a tap position. If you do customize, Tinder like card UI is a possible.
                   DESC

  s.homepage     = "https://github.com/shima11/TapCardView"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "shima" => "shima.jin@icloud.com" }

  s.platform     = :ios, "8.0"

  s.source = { :git => "https://github.com/shima11/TapCardView.git", :tag => "#{s.version}"}

  s.source_files  = "TapCardView", "TapCardView/**/*.{h,m}"

end
