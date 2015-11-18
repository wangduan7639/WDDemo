//
//  WDHttprequestHandler.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDHttpRequestParam.h"

@interface WDHttpRequestHandler : NSObject

@property (nonatomic, strong) WDHttpRequestParam* requestParam;
@property (nonatomic, assign) NSTimeInterval timeOutSeconds; //默认15秒
@property (nonatomic, copy) WDRequestSuccessBlock successBlock;
@property (nonatomic, copy) WDRequestFailureBlock failureBlock;
@property (nonatomic, weak) id<WDHttpRequestDelegate>  delegate;
@property (nonatomic, weak) id  target;
@property (nonatomic, assign) SEL selAction;
@property (nonatomic, assign) BOOL  showHUD;

- (instancetype) initWithRequestParam:(WDHttpRequestParam*)param target:(id)target action:(SEL)action delegate:(id<WDHttpRequestDelegate>)delegate success:(WDRequestSuccessBlock)success failure:(WDRequestFailureBlock)failure showHUD:(BOOL)showHUD;
//不需要上传数据时使用
- (void)connect;
//需要上传图片时使用。
- (void)updateImageWithImage:(UIImage *)image;
- (void)cancel;
@end
