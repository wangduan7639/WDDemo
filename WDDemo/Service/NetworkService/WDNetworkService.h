//
//  WDNetworkSerivice.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDNetworkDefine.h"
@class WDModel;
@class WDHttpRequestHandler;
@class WDHttpRequestParam;

@interface WDNetworkService : NSObject
+(instancetype)defaultService;
- (void)cancelWithRequestName:(NSString *)name;
- (void)cancelAll;
- (void)startMonitoring;
- (WDHttpRequestHandler *)wd_httpRequestWithParam:(WDHttpRequestParam *)param
                                           target:(id)target
                                           action:(SEL)action
                                         delegate:(id<WDHttpRequestDelegate>)delegate
                                     successBlock:(WDRequestSuccessBlock)success
                                     failureBlock:(WDRequestFailureBlock)failure
                                          showHUD:(BOOL)showHUD;
@end
