//
//  WDNetworkDefine.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDModel.h"
/**
 *  请求类型
 */
typedef NS_ENUM (NSInteger, WDHttpMethodType) {
    WDHttpMethodTypeGet,
    WDHttpMethodTypePost,
    WDHttpMethodTypePut,
};

/**
 *  请求成功回调
 *
 *  @param WDRequestSuccessBlock 回调block
 */
typedef void (^ WDRequestSuccessBlock)(WDModel * model);


/**
 *  请求失败回调
 *
 *  @param WDRequestFailureBlock 回调block
 */
typedef void (^ WDRequestFailureBlock)(NSError* error);


/**
 *   AFN 请求封装的代理协议
 */
@protocol WDHttpRequestDelegate <NSObject>

@optional
/**
 *   请求结束
 *
 *   @param  返回的数据
 */
- (void)requestDidFinishWithData:(WDModel *)model;
/**
 *   请求失败
 *
 *   @param error 失败的 error
 */
- (void)requestDidFailWithError:(NSError*)error;

/**
 *   target   SEL的默认方法，规则。
 */
- (void)finishedRequest:(WDModel *)model didFaild:(NSError*)error;

@end


typedef NS_ENUM (NSInteger, WDRequestTag) {
    WDRequestTag_Unknown,
    WDRequestTag_GetProduceCode = 10,
    WDRequestTag_WeekRank = 11,
};
