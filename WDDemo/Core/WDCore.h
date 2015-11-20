//
//  Header.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#ifndef WDCore_h
#define WDCore_h

#import "ExtensionUIImage.h"
#import "UIColor+Tool.h"
#import "NSString+Tool.h"
#import "UIView+Tool.h"
//设备屏幕大小
#define __MainScreenFrame   [[UIScreen mainScreen] bounds]
//设备屏幕宽
#define __MainScreen_Width  ((__MainScreenFrame.size.width) < (__MainScreenFrame.size.height) ? (__MainScreenFrame.size.width) : (__MainScreenFrame.size.height))
#define __MainScreen_Height ((__MainScreenFrame.size.height) > (__MainScreenFrame.size.width) ? (__MainScreenFrame.size.height) : (__MainScreenFrame.size.width))
#define FKStatusBarHeight   20.0f
#define FKNavigationBarHeight  44.0f
#define FKTabBarHeight        49.0f
#define OnePixelSeparatorHeight (((int) [[UIScreen mainScreen] scale]) ? 0.5 : 1.0)

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

#endif /* WDCore_h */
