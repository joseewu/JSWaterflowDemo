source 'https://github.com/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!
inhibit_all_warnings!


def defaults

    # Pods for RockMe
  
    pod 'Alamofire'
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
    pod 'SwiftLint'
    pod 'ReachabilitySwift', '~> 4.1'
    pod 'RxAlamofire'
    pod 'SVProgressHUD'
    pod 'SDWebImage', '~> 4.0'
  
    
end

def test 

	pod 'RxBlocking', '~> 4.0'
    pod 'RxTest', '~> 4.0'

end


target 'JSWaterFallCollectionViewDemo' do
    defaults
end


target 'JSWaterFallCollectionViewDemoTests' do
    defaults
    test
end


target 'JSWaterFallCollectionViewDemoUITests' do
    defaults
    # Pods for testing
end

