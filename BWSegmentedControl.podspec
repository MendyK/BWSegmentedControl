
Pod::Spec.new do |s|

  s.name         = "BWSegmentedControl"
  s.version      = "0.0.1"
  s.summary      = "A segmented control with a ball indicator "
  s.license      =  { :type => 'MIT' }


  s.homepage     = "https://github.com/MendyK/BWSegmentedControl"
  s.ios.deployment_target = '7.0'

  s.source       = { :git => "https://github.com/MendyK/BWSegmentedControl.git", :commit => "149b05b9e426616e173b68ab6158f074ffa6142d" }
  s.source_files  = "Segmented Control/*.{h,m}"
end
