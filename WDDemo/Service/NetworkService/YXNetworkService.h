//
//  YXNetworkSerivice.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YXModel;
@class YXHttpRequestHandler;
@class YXHttpRequestParam;

typedef void (^ YXRequestSuccessBlock)(YXModel * model);
typedef void (^ YXRequestFailureBlock)(NSError* error);

@interface YXNetworkService : NSObject
+(instancetype)defaultService;
- (YXHttpRequestHandler *)yx_httpRequestWithParam:(YXHttpRequestParam *)param successBlock:(YXRequestSuccessBlock)success failureBlock:(YXRequestFailureBlock)failure;
@end
