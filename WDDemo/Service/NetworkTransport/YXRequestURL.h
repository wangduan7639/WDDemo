//
//  YXRequestURL.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXRequestURL : NSObject
//默认NO
@property (assign, nonatomic) BOOL isTestAPI;
@property (readonly, nonatomic) NSString* YXBaseUrl;
@property (readonly, nonatomic) NSString* YX2BaseUrl;

+ (instancetype) instance;

@end
