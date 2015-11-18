//
//  WDNetworkSerivice.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkService.h"
#import "WDHttpRequestParam.h"
#import "WDHttpRequestHandler.h"
#import "WDModel.h"

@implementation WDNetworkService
+(instancetype)defaultService
{
    static dispatch_once_t _onceToken = 0;
    static WDNetworkService* _defaultService = nil;
    dispatch_once(&_onceToken, ^{
        _defaultService = [[self alloc] init];
    });
    return _defaultService;
}

- (void)cancelWithRequestName:(NSString *)name
{
    AFHTTPRequestOperationManager * s_requestOperationManager = [AFHTTPRequestOperationManager manager];
    [[s_requestOperationManager.operationQueue operations] enumerateObjectsUsingBlock:^(__kindof NSOperation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        AFHTTPRequestOperation * operation = obj;
        if ([operation.name isEqualToString:name]) {
            [operation cancel];
        }
    }];
}
- (void)cancelAll
{
    AFHTTPRequestOperationManager * s_requestOperationManager = [AFHTTPRequestOperationManager manager];
    [s_requestOperationManager.operationQueue cancelAllOperations];
}
- (void)startMonitoring
{
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                break;
        }
    }];
    [mgr startMonitoring];
}

- (WDHttpRequestHandler *)wd_httpRequestWithParam:(WDHttpRequestParam *)param
                                           target:(id)target
                                           action:(SEL)action
                                         delegate:(id<WDHttpRequestDelegate>)delegate
                                     successBlock:(WDRequestSuccessBlock)success
                                     failureBlock:(WDRequestFailureBlock)failure
                                          showHUD:(BOOL)showHUD
{
    WDHttpRequestHandler *handler = [[WDHttpRequestHandler alloc] initWithRequestParam:param target:target action:action delegate:delegate success:success failure:failure showHUD:showHUD];
    
    [handler connect];
    return handler;
}
@end
