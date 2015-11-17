//
//  YXNetworkTestService.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXNetworkTestService.h"
#import "YXRequestURL.h"
#import "YXModel.h"

@implementation YXNetworkTestService
- (YXHttpRequestHandler *)yx_requestGetProduceCodeWithPhoneNumber:(NSString *)phone type:(NSString *)type successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)failure
{
    phone = [NSString getSafeStringWithString:phone];
    type = [NSString getSafeStringWithString:type];
    YXHttpRequestParam *param = [[YXHttpRequestParam alloc] initWithHttpMethodType: YXHttpMethodTypeGet fullUrl: [NSString stringWithFormat:@"%@/app/user/produceCode.do",[YXRequestURL instance].YXBaseUrl]];
    [param setParamsWithDictionay:@{
                                   @"mobile": phone,
                                   @"type":type,
                                   }];
    return  [self yx_httpRequestWithParam:param successBlock:success failureBlock:failure];
}
- (YXHttpRequestHandler *)yx_requestUpdateImageWithImage:(UIImage *)image successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)failure
{
    YXHttpRequestParam *param = [[YXHttpRequestParam alloc] initWithHttpMethodType: YXHttpMethodTypeGet fullUrl: [NSString stringWithFormat:@"%@/app/user/updateimage",[YXRequestURL instance].YXBaseUrl]];
    YXHttpRequestHandler * requestHandle = [[YXHttpRequestHandler alloc] initWithRequestParam:param success:^(YXHttpRequestHandler *handler, id object) {
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
    } failure:^(YXHttpRequestHandler *handler, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    [requestHandle updateImageWithImage:image];
    return requestHandle;
}

//block
- (YXHttpRequestHandler *)yx_requestWithURL:(NSString *)url methodType:(YXHttpMethodType)type params:(NSDictionary *)paramsDict successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)frailureBlock showHUD:(BOOL)showHUD
{
    
}
//delegate
- (YXHttpRequestHandler *)yx_requestWithURL:(NSString *)url methodType:(YXHttpMethodType)type params:(NSDictionary *)paramsDict delegate:(id)delegate showHUD:(BOOL)showHUD
{

}
//SEL
- (YXHttpRequestHandler *)yx_requestWithURL:(NSString *)url methodType:(YXHttpMethodType)type params:(NSDictionary *)paramsDict target:(id)target action:(SEL)action showHUD:(BOOL)showHUD
{
    
}
@end
