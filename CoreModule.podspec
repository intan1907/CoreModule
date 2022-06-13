Pod::Spec.new do |spec|
  spec.name                   = "CoreModule"
  spec.version                = "1.0.8"
  spec.summary                = "This is a CoreModule that contains files related with data transaction"
  spec.description            = <<-DESC
                                  CoreModule contains abstractions such as protocols and generic classes related with data source
                                DESC

  spec.homepage               = "https://github.com/intan1907/CoreModule"
  spec.license                = { :type => "MIT", :file => "LICENSE" }
  spec.author                 = { "Intan Nurjanah" => "intan3951@gmail.com" }

  spec.platform               = :ios, "14.2"

  spec.source                 = { :git => "https://github.com/intan1907/CoreModule.git", :tag => "#{spec.version}" }

  spec.source_files           = "CoreModule/**/*.{h,m,swift,a}"

  spec.framework              = "UIKit"

  spec.swift_version          = "5.0"

  spec.dependency 'Alamofire', '5.6.1'
  spec.dependency 'RealmSwift', '~> 10.25.0'
end
