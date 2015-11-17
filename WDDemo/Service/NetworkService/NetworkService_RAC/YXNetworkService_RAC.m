//
//  YXNetworkService_RAC.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXNetworkService_RAC.h"

static NSString * YX_SERVER_BASE_URL = @"http://mobile.hwk.yanxiu.com";
@implementation YXNetworkService_RAC
+ (instancetype) defaultService
{
    return nil;
}
- (instancetype) init
{
    self = [super init];
    if (self) {
        NSURL* baseUrl = [NSURL URLWithString: YX_SERVER_BASE_URL];
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
