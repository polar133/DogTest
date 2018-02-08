# Uncomment the next line to define a global platform for your project
inhibit_all_warnings!
use_frameworks!
platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'


def visual_pods
    pod 'MBProgressHUD'
    pod 'SkeletonView'
    pod 'GSKStretchyHeaderView'
    pod 'Hero'
end

def general_pods
    pod 'CocoaLumberjack/Swift'
    pod 'Kingfisher'
end

def networking_pods
	pod 'UnboxedAlamofire', '~> 2.0' #Alamofire + Unbox - Disclaimer: It's better to keep things separated but for this test i will use this pod to gain time
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
    pod 'Mockingjay'
end

target 'dogTest' do
  # Pods for dogTest
  visual_pods
  general_pods
  networking_pods

  target 'dogTestTests' do
    inherit! :search_paths
    testing_pods
  end

end
