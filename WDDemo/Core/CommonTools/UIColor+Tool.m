//
//  UIColor+Tool.m
//  WindStock
//
//  Created by ZhengShixi on 15/6/11.
//  Copyright (c) 2015年 ZhangLei. All rights reserved.
//

#import "UIColor+Tool.h"

@implementation UIColor (Tool)
+ (UIColor*) colorWithHexString: (NSString*) stringToConvert
{
    if ([stringToConvert hasPrefix: @"#"]) {
        stringToConvert = [stringToConvert substringFromIndex: 1];
    }

    NSScanner* scanner = [NSScanner scannerWithString: stringToConvert];
    unsigned hexNum;

    if (![scanner scanHexInt: &hexNum]) {
        return nil;
    }

    return [UIColor colorWithRGBHex: hexNum];
}

+ (UIColor*) colorWithRGBHex: (UInt32) hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;

    return [UIColor colorWithRed: r / 255.0f
                           green: g / 255.0f
                            blue: b / 255.0f
                           alpha: 1.0f];
}

@end
