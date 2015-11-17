//
//  YXNetworkSerivice.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXNetworkService.h"
#import "YXHttpRequestParam.h"
#import "YXHttpRequestHandler.h"
#import "YXModel.h"

@implementation YXNetworkService
+(instancetype)defaultService
{
    static dispatch_once_t _onceToken = 0;
    static YXNetworkService* _defaultService = nil;
    dispatch_once(&_onceToken, ^{
        _defaultService = [[self alloc] init];
    });
    return _defaultService;
}
- (YXHttpRequestHandler *)yx_httpRequestWithParam:(YXHttpRequestParam *)param successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)failure
{
    YXHttpRequestHandler *handler = [[YXHttpRequestHandler alloc] initWithRequestParam: param
     success: ^(YXHttpRequestHandler *handler, id object)
    {
         if (![NSJSONSerialization isValidJSONObject:object]) {
             if (failure) {
                 failure(nil);
             }
         }else{
             YXModel * model = [[YXModel alloc] initWithDictionary:object error:nil];
             if (success) {
                 success (model);
             }
         }
     }
     failure: ^(YXHttpRequestHandler *handler, NSError *error)
     {
         if (failure) {
             failure(error);
         }
     }];
    
    [handler connect];
    return handler;
}
@end
