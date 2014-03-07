Pod::Spec.new do |s|
  s.name         = "DPKit-NSWindow"
  s.version      = "0.0.1"
  s.summary      = "DPKit-NSWindow"
  s.homepage     = "http://dpostigo.com"
  s.license      = 'BSD'
  s.author       = { "Dani Postigo" => "dani@firstperson.is" }


  s.source       = { :git => "https://github.com/dpostigo/DPKit-NSWindow.git", :tag => s.version.to_s }
  s.platform     = :osx, '10.8'


  # s.dependency     'NSColor-Crayola'
  # s.dependency     'NSView-NewConstraints'
  # s.dependency     'DPKit'
  # s.dependency     'DPKit-Styles'
  s.frameworks   = 'Foundation', 'QuartzCore'
  s.requires_arc = true

  s.source_files = 'DPKit-NSWindow/*.{h,m}'



  
end
