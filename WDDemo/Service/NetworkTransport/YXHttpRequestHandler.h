//
//  YXHttprequestHandler.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXHttpRequestParam.h"

@class YXHttpRequestHandler;
typedef void (^ YXHttpRequesthandlerSuccessBlock)(YXHttpRequestHandler* handler, id object);
typedef void (^ YXHttpRequestHandlerFailureBlock)(YXHttpRequestHandler* handler, NSError* error);

@interface YXHttpRequestHandler : NSObject

@property (strong, nonatomic) YXHttpRequestParam* requestParam;
@property (assign, nonatomic) NSTimeInterval timeOutSeconds; //默认15秒
@property (copy, nonatomic) YXHttpRequesthandlerSuccessBlock successBlock;
@property (copy, nonatomic) YXHttpRequestHandlerFailureBlock failureBlock;

- (instancetype) initWithRequestParam: (YXHttpRequestParam*) param
                              success: (YXHttpRequesthandlerSuccessBlock) success
                              failure: (YXHttpRequestHandlerFailureBlock) failure;
//不需要上传数据时使用
- (void) connect;
//需要上传图片时使用。
- (void) updateImageWithImage:(UIImage *)image;
- (void) cancel;
@end
