//
//  YXHttprequestHandler.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXHttpRequestHandler.h"

static AFHTTPRequestOperationManager * s_requestOperationManager = nil;
@implementation YXHttpRequestHandler{
    AFHTTPRequestOperation* _requestOperation;
}
- (instancetype)initWithRequestParam:(YXHttpRequestParam *)param success:(YXHttpRequesthandlerSuccessBlock)success failure:(YXHttpRequestHandlerFailureBlock)failure
{
    if (self = [super init]) {
        self.requestParam = param;
        self.successBlock = success;
        self.failureBlock = failure;
        self.timeOutSeconds = 15;
        
        static dispatch_once_t _onceToken = 0;
        dispatch_once (&_onceToken, ^() {
            s_requestOperationManager = [AFHTTPRequestOperationManager manager];
            s_requestOperationManager.responseSerializer = [AFJSONResponseSerializer serializer];
            s_requestOperationManager.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithArray: @[@"text/html", @"application/json", @"image/gif"]];
        });
    }
    return self;
}
- (void) connect
{
    NSMutableURLRequest * urlRequest = [s_requestOperationManager.requestSerializer requestWithMethod:self.requestParam.httpMethod URLString:[[NSURL URLWithString: self.requestParam.url] absoluteString] parameters:self.requestParam.params error:nil];
    
    urlRequest.timeoutInterval = self.timeOutSeconds;
    urlRequest.allHTTPHeaderFields = self.requestParam.headers;
    
    __weak typeof (self) weakSelf = self;
    _requestOperation = [s_requestOperationManager HTTPRequestOperationWithRequest: urlRequest success: ^(AFHTTPRequestOperation* operation, id responseObject){
        if (weakSelf.successBlock) {
            weakSelf.successBlock (weakSelf, responseObject);
        }
    } failure: ^(AFHTTPRequestOperation* operation, NSError* error){
        if (weakSelf.failureBlock) {
            weakSelf.failureBlock (weakSelf, error);
        }
    }];
    [s_requestOperationManager.operationQueue addOperation: _requestOperation];
}
- (void) updateImageWithImage:(UIImage *)image
{
    if (!image) {
        self.failureBlock(self,[NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"空图像" }]);
    }
   
    __weak typeof (self) weakSelf = self;
    [s_requestOperationManager POST:[[NSURL URLWithString: self.requestParam.url] absoluteString] parameters:self.requestParam.params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSString* imageName = [NSString stringWithFormat: @"image%d.jpg", (int) ([[NSDate date] timeIntervalSince1970] / 1)];
        NSData* data = UIImageJPEGRepresentation (image, 1.0f);
        [formData appendPartWithFileData: data name: @"user_img" fileName: imageName mimeType: @"image/jpg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.successBlock) {
            self.successBlock(weakSelf,responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (weakSelf.failureBlock) {
            weakSelf.failureBlock (weakSelf, error);
        }
    }];

}
- (void) cancel
{
    if (_requestOperation) {
        [_requestOperation cancel];
        _requestOperation = nil;
    }
}
@end
