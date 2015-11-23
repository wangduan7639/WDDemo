 platform :ios, :deployment_target => "8.0"

pod 'Masonry', '0.6.1'
pod 'ReactiveCocoa', '2.4.7'
pod 'AFNetworking', '2.5.4'
pod 'AFNetworking-RACExtensions', '0.1.8'
pod 'AFNetworking-RACRetryExtensions', '0.2.0'
pod 'JSONModel', '1.1.0'
pod 'JSONModel-RACExtensions', '0.2.1'
pod 'RETableViewManager', '1.6'
pod 'SVProgressHUD', '1.1.3'
pod 'UIGestureRecognizer+ReactiveCocoa', '0.1.0'
pod 'NJKWebViewProgress', '0.2.3'
pod 'UIColor-Utilities', '1.0.1'
pod 'SAMTextView', '0.2.2'
pod 'MWPhotoBrowser','2.1.1'
pod 'NSString-UrlEncode','2.0.0'
pod 'NSString-Helper','1.0.1'
pod 'NSString+Helpers','0.1.6'
pod 'NSString+Color','1.1.3'
pod 'Nimbus', '~> 1.2.0'
pod 'NimbusKit-Basics', '~> 1.2.1'
pod 'DTCoreText', '~> 1.6.16'
pod 'CoreTextLabel', '~> 1.5.13'
pod 'FMDB', '~> 2.5'
pod 'FMDBHelpers', '~> 0.0.7'
pod 'JSPatch', '~> 0.1.4'
pod 'JSPatch/Extensions', '~> 0.1.4'
pod 'JSPatch/Core', '~> 0.1.4'


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_STRICT_OBJC_MSGSEND'] = 'NO'
        end
    end
end





