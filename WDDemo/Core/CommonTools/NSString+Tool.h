//
//  NSString+Tool.h
//  WindStock
//
//  Created by ZhengShixi on 15/6/11.
//  Copyright (c) 2015年 ZhangLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)
/*
 *判断是一个字符串是否是空串或者nil。
 */
+ (BOOL) isBlankString: (NSString*) string;

+ (NSString *)getSafeStringWithString:(NSString*)str;

@end
