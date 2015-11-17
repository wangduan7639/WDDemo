//
//  YXRequestURL.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXRequestURL.h"

@implementation YXRequestURL
+ (instancetype) instance
{
    static dispatch_once_t _onceToken = 0;
    static YXRequestURL* _defaultRequestUrl = nil;
    
    dispatch_once (&_onceToken, ^() {
        _defaultRequestUrl = [[self alloc] init];
    });
    return _defaultRequestUrl;
}

- (instancetype) init
{
    if (self = [super init]) {
        self.isTestAPI = NO;
    }
    return self;
}

- (NSString*) YXBaseUrl
{
    if (self.isTestAPI) {
        return @"http://test.yx...../";
    } else {
        return @"http://mobile.hwk.yanxiu.com";
    }
}
- (NSString*)YX2BaseUrl
{
    if (self.isTestAPI) {
        return @"http://test.yx...../";
    } else {
        return @"http://yx.....";
    }
}
@end
