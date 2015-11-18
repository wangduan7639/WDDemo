//
//  WDNetworkTestService.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkTestService.h"
#import "WDRequestURL.h"
#import "WDModel.h"

@implementation WDNetworkTestService

//- (WDHttpRequestHandler *)WD_requestUpdateImageWithImage:(UIImage *)image successBlock:(WDRequestSuccessBlock)success failureBlock:(WDRequestFailureBlock)failure
//{
//    WDHttpRequestParam *param = [[WDHttpRequestParam alloc] initWithHttpMethodType: WDHttpMethodTypeGet fullUrl: [NSString stringWithFormat:@"%@/app/user/updateimage",[WDRequestURL instance].WDBaseUrl]];
//    WDHttpRequestHandler * requestHandle = [[WDHttpRequestHandler alloc] initWithRequestParam:param success:^(WDHttpRequestHandler *handler, id object) {
//        if (![NSJSONSerialization isValidJSONObject:object]) {
//            if (failure) {
//                failure(nil);
//            }
//        }else{
//            WDModel * model = [[WDModel alloc] initWithDictionary:object error:nil];
//            if (success) {
//                success (model);
//            }
//        }
//    } failure:^(WDHttpRequestHandler *handler, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//    [requestHandle updateImageWithImage:image];
//    return requestHandle;
//}

//block
- (WDHttpRequestHandler *)wd_requestWithURL:(NSString *)url methodType:(WDHttpMethodType)type params:(NSDictionary *)paramsDict successBlock:(WDRequestSuccessBlock)success failureBlock:(WDRequestFailureBlock)failureBlock showHUD:(BOOL)showHUD
{
    if (!(url && url.length > 0)) {
        if (failureBlock) {
            NSError * error = [NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"url error" }];
            failureBlock(error);
        }
    }
    WDHttpRequestParam *param = [[WDHttpRequestParam alloc] initWithHttpMethodType: type fullUrl: url];
    [param setParamsWithDictionay:paramsDict];
    return [self wd_httpRequestWithParam:param target:nil action:nil delegate:nil successBlock:success failureBlock:failureBlock showHUD:showHUD];
}
//delegate
- (WDHttpRequestHandler *)wd_requestWithURL:(NSString *)url methodType:(WDHttpMethodType)type params:(NSDictionary *)paramsDict delegate:(id<WDHttpRequestDelegate>)delegate showHUD:(BOOL)showHUD
{
    if (!(url && url.length > 0)) {
        if (delegate && [delegate respondsToSelector:@selector(requestDidFailWithError:)]) {
            NSError * error = [NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"url error" }];
            [delegate performSelector:@selector(requestDidFailWithError:) withObject:error];
        }
    }
    WDHttpRequestParam *param = [[WDHttpRequestParam alloc] initWithHttpMethodType: type fullUrl: url];
    [param setParamsWithDictionay:paramsDict];
    return [self wd_httpRequestWithParam:param target:nil action:nil delegate:delegate successBlock:nil failureBlock:nil showHUD:showHUD];
}
//SEL
- (WDHttpRequestHandler *)wd_requestWithURL:(NSString *)url methodType:(WDHttpMethodType)type params:(NSDictionary *)paramsDict target:(id)target action:(SEL)action showHUD:(BOOL)showHUD
{
    if (!(url && url.length > 0)) {
        if (target && [target respondsToSelector:@selector(action)]) {
            NSError * error = [NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"url error" }];
            [target performSelector:@selector(action) withObject:nil withObject:error];
        }
    }
    WDHttpRequestParam *param = [[WDHttpRequestParam alloc] initWithHttpMethodType: type fullUrl: url];
    [param setParamsWithDictionay:paramsDict];
    return [self wd_httpRequestWithParam:param target:target action:action delegate:nil successBlock:nil failureBlock:nil showHUD:showHUD];
}
@end
