source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def testing_pods
    pod 'Quick', '~> 0.8.0'
    pod 'Nimble', '3.0.0'
	pod "Himotoki", "~> 1.3.2"
end

def swiftMvvmReactiveCocoa_pods
	pod 'ReactiveCocoa', '~> 4.0.0-RC.1'
	pod 'Alamofire', '~> 3.1.0'
	pod 'SwiftyJSON', '~> 2.3.0'
	pod 'Swinject', '0.5'
	pod "Himotoki", "~> 1.3.2"
end


target 'SwiftMvvmReactiveCocoa' do
	swiftMvvmReactiveCocoa_pods
end

target 'SwiftMvvmReactiveCocoaModel' do
	swiftMvvmReactiveCocoa_pods
end

target 'SwiftMvvmReactiveCocoaViewModel' do
	swiftMvvmReactiveCocoa_pods
end

target 'SwiftMvvmReactiveCocoaView' do
	swiftMvvmReactiveCocoa_pods
end

target 'SwiftMvvmReactiveCocoaModelTests' do
    pod 'Quick', '~> 0.8.0'
    pod 'Nimble', '3.0.0'
	pod "Himotoki", "~> 1.3.2"
end

target 'SwiftMvvmReactiveCocoaViewModelTests' do
	testing_pods
end

target 'SwiftMvvmReactiveCocoaViewTests' do
	testing_pods
end

target 'SwiftMvvmReactiveCocoaTests' do
	testing_pods
end

target 'SwiftMvvmReactiveCocoaUITests' do
	testing_pods
end