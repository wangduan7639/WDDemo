//
//  WDNavigationManager.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class WDBaseViewController;
@interface WDNavigationManager : NSObject

@property (nonatomic, strong) UIViewController  * rootViewController;
+ (WDNavigationManager*)sharedManager;
- (void)pushNavigationController: (UINavigationController*) navigationController;
- (void)presentViewControllerView:(UIViewController *)viewController;
- (UINavigationController*) dismissNavigationController;
- (void)pushViewController:(UIViewController *)viewController;
@end
