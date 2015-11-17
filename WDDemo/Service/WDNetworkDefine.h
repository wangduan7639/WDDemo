//
//  WDNetworkDefine.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#ifndef WDNetworkDefine_h
#define WDNetworkDefine_h

/**
 *  请求类型
 */
typedef enum {
    WDNetworkGET = 1,   //get
    WDNetworkPOST       //post
} WDNetworkType;

#if NS_BLOCKS_AVAILABLE
/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^WDNetworkStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^WDNetworkSuccessBlock)(id reponseData);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^WDNetworkFailureBlock)(NSError *error);

#endif

#endif /* WDNetworkDefine_h */
