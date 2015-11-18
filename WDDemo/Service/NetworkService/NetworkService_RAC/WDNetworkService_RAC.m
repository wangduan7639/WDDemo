//
//  WDNetworkService_RAC.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkService_RAC.h"

static NSString * WD_SERVER_BASE_URL = @"http://mobile.hwk.yanxiu.com";
@implementation WDNetworkService_RAC
+ (instancetype) defaultService
{
    return nil;
}
- (instancetype) init
{
    self = [super init];
    if (self) {
        NSURL* baseUrl = [NSURL URLWithString: WD_SERVER_BASE_URL];
        _client = [[AFHTTPRequestOperationManager alloc] initWithBaseURL: baseUrl];
        _client.responseSerializer.acceptableContentTypes = [NSSet setWithArray: @[
                                                            @"application/json",
                                                            @"text/javascript",
                                                            @"text/html",
        ]];
    }
    return self;
}

@end
