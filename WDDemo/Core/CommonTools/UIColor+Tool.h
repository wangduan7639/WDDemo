//
//  UIColor+Tool.h
//  WindStock
//
//  Created by ZhengShixi on 15/6/11.
//  Copyright (c) 2015年 ZhangLei. All rights reserved.
//

#define RGBCOLOR(r, g, b) [UIColor colorWithRed : (r) / 255.0f green : (g) / 255.0f blue : (b) / 255.0f alpha : 1]
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed : (r) / 255.0f green : (g) / 255.0f blue : (b) / 255.0f \
                               alpha : (a)]
#define FKDefaultBackGroudColor RGBCOLOR (214, 213, 217)
#define FKDefaultLineColor  RGBCOLOR (214, 213, 217)

#import <UIKit/UIKit.h>


@interface UIColor (Tool)
/*
 *得到一个UIColor，传入一个色值字符串例如（@"#233D5F"）
 */
+ (UIColor*) colorWithHexString: (NSString*) stringToConvert;
@end
