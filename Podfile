# Uncomment the next line to define a global platform for your project
platform :ios, '14.2'

target 'CoreModule' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CoreModule
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :tag => '5.6.1'
  pod 'RealmSwift', '~> 10.25.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.2'
    end
  end
end