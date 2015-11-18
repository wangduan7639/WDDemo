//
//  WDNetworkTestService.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkService.h"
#import "WDHttpRequestHandler.h"

@interface WDNetworkTestService : WDNetworkService

//- (WDHttpRequestHandler *)WD_requestUpdateImageWithImage:(UIImage *)image successBlock:(WDRequestSuccessBlock)success failureBlock:(WDRequestFailureBlock)failure;

//block
- (WDHttpRequestHandler *)wd_requestWithURL:(NSString *)url methodType:(WDHttpMethodType)type params:(NSDictionary *)paramsDict successBlock:(WDRequestSuccessBlock)success failureBlock:(WDRequestFailureBlock)frailureBlock showHUD:(BOOL)showHUD;
//delegate
- (WDHttpRequestHandler *)wd_requestWithURL:(NSString *)url methodType:(WDHttpMethodType)type params:(NSDictionary *)paramsDict delegate:(id<WDHttpRequestDelegate>)delegate showHUD:(BOOL)showHUD;
//SEL
- (WDHttpRequestHandler *)wd_requestWithURL:(NSString *)url methodType:(WDHttpMethodType)type params:(NSDictionary *)paramsDict target:(id)target action:(SEL)action showHUD:(BOOL)showHUD;

@end
