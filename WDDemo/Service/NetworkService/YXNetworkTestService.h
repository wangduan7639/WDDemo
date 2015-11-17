//
//  YXNetworkTestService.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXNetworkService.h"
#import "YXHttpRequestHandler.h"

@interface YXNetworkTestService : YXNetworkService

//- (YXHttpRequestHandler *)yx_requestUpdateImageWithImage:(UIImage *)image successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)failure;

//block
- (YXHttpRequestHandler *)yx_requestWithURL:(NSString *)url methodType:(YXHttpMethodType)type params:(NSDictionary *)paramsDict successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)frailureBlock showHUD:(BOOL)showHUD;
//delegate
- (YXHttpRequestHandler *)yx_requestWithURL:(NSString *)url methodType:(YXHttpMethodType)type params:(NSDictionary *)paramsDict delegate:(id)delegate showHUD:(BOOL)showHUD;
//SEL
- (YXHttpRequestHandler *)yx_requestWithURL:(NSString *)url methodType:(YXHttpMethodType)type params:(NSDictionary *)paramsDict target:(id)target action:(SEL)action showHUD:(BOOL)showHUD;

@end
