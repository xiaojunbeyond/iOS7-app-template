Pod::Spec.new do |s|
  s.name         = "MyApp"
  s.version      = "0.1.0"
  s.summary      = "template app"
  
  s.source       = {
      :git => "path_to_git",
      :tag => s.version.to_s
    }
	
  s.ios.deployment_target = '7.0'
    
  s.default_subspec = 'Core'

  s.subspec 'Core' do |c|
    c.requires_arc = true
    c.source_files = 'MyApp/Source/*'
    c.resources = 'MyApp/Resources/*'
	c.dependency 'MyApp/Core-no-arc'
    c.preserve_paths = "MyApp.xcodeproj", "Podfile"
  end
  
  s.subspec 'Core-no-arc' do |cna|
    cna.requires_arc = false
    cna.source_files = 'MyApp/Source-no-arc/*'
	cna.dependency 'MyApp/Core'
  end

end