//
//  WDRequestURL.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDRequestURL.h"

@implementation WDRequestURL
+ (instancetype) instance
{
    static dispatch_once_t _onceToken = 0;
    static WDRequestURL* _defaultRequestUrl = nil;
    
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

- (NSString*) WDBaseUrl
{
    if (self.isTestAPI) {
        return @"http://test.WD...../";
    } else {
        return @"http://mobile.hwk.yanxiu.com";
    }
}
- (NSString*)WD2BaseUrl
{
    if (self.isTestAPI) {
        return @"http://test.WD...../";
    } else {
        return @"http://WD.....";
    }
}

- (NSString *)urlWithRequestTag:(WDRequestTag)tag
{
    NSString * urlString = @"";
    //根据自己的需要添加tag。
    switch (tag) {
        case WDRequestTag_GetProduceCode:
            urlString = [self.WDBaseUrl stringByAppendingString:@"/app/user/produceCode.do"];
            break;
        default:
            break;
    }
    return urlString;
}
@end
