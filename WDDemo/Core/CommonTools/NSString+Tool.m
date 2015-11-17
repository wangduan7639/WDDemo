//
//  NSString+Tool.m
//  WindStock
//
//  Created by ZhengShixi on 15/6/11.
//  Copyright (c) 2015年 ZhangLei. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)
+ (BOOL) isBlankString: (NSString*) string
{
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isEqual: nil]
        || [string isEqual: Nil]) {
        return YES;
    }
    if (![string isKindOfClass: [NSString class]]) {
        return YES;
    }
    if (0 == [string length]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    if ([string isEqualToString: @"(null)"]) {
        return YES;
    }

    return NO;
}

+ (NSString *)getSafeStringWithString:(NSString*)str
{
    if (str && [str length]) {
        return str;
    }else{
        return @"";
    }
}

@end
