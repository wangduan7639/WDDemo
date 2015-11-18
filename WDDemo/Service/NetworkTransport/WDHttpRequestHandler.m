//
//  WDHttprequestHandler.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDHttpRequestHandler.h"

static AFHTTPRequestOperationManager * s_requestOperationManager = nil;

@interface WDHttpRequestHandler ()
{
    AFHTTPRequestOperation* _requestOperation;
}


@end
@implementation WDHttpRequestHandler

- (instancetype) initWithRequestParam:(WDHttpRequestParam*)param target:(id)target action:(SEL)action delegate:(id<WDHttpRequestDelegate>)delegate success:(WDRequestSuccessBlock)success failure:(WDRequestFailureBlock)failure showHUD:(BOOL)showHUD
{
    if (self = [super init]) {
        self.requestParam = param;
        self.delegate = delegate;
        self.target = target;
        self.selAction = action;
        self.showHUD = showHUD;
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
    if (self.showHUD) {
        [self startShowHUD];
    }
    __weak typeof (self) weakSelf = self;
    _requestOperation = [s_requestOperationManager HTTPRequestOperationWithRequest: urlRequest success: ^(AFHTTPRequestOperation* operation, id responseObject){
        [weakSelf dismissHUD];
        [weakSelf requestFinishSuccess:responseObject];
    } failure: ^(AFHTTPRequestOperation* operation, NSError* error){
        [weakSelf dismissHUD];
        [weakSelf requestFinishFailure:error];
    }];
    _requestOperation.name = self.requestParam.url;
    [s_requestOperationManager.operationQueue addOperation: _requestOperation];
}

- (void)updateImageWithImage:(UIImage *)image
{
    if (!image) {
        self.failureBlock([NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"空图像" }]);
    }
    
    __weak typeof (self) weakSelf = self;
    [s_requestOperationManager POST:[[NSURL URLWithString: self.requestParam.url] absoluteString] parameters:self.requestParam.params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSString* imageName = [NSString stringWithFormat: @"image%d.jpg", (int) ([[NSDate date] timeIntervalSince1970] / 1)];
        NSData* data = UIImageJPEGRepresentation (image, 1.0f);
        [formData appendPartWithFileData: data name: @"user_img" fileName: imageName mimeType: @"image/jpg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [weakSelf requestFinishSuccess:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf requestFinishFailure:error];
    }];
    
}

- (void)requestFinishSuccess:(id)responseObject
{
    if (![NSJSONSerialization isValidJSONObject:responseObject]) {
        NSError * error = [NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"responseJSON NULL" }];
        [self requestFinishFailure:error];
    }else{
        WDModel * model = [[WDModel alloc] initWithDictionary:responseObject error:nil];
        if (self.successBlock) {
            self.successBlock(model);
        }
        if (self.delegate && [self respondsToSelector:@selector(requestDidFinishWithData:)]) {
            [self.delegate performSelector:@selector(requestDidFinishWithData:) withObject:model];
        }
        if (self.target && [self.target respondsToSelector:@selector(action)]) {
            [self.target performSelector:@selector(action) withObject:model withObject:nil];
        }
    }
}

- (void)requestFinishFailure:(NSError *)error
{
    if (self.failureBlock) {
        self.failureBlock (error);
    }
    if (self.delegate && [self respondsToSelector:@selector(requestDidFailWithError:)]) {
        [self.delegate performSelector:@selector(requestDidFailWithError:) withObject:error];
    }
    if (self.target && [self.target respondsToSelector:@selector(action)]) {
        [self.target performSelector:@selector(action) withObject:nil withObject:error];
    }

}

- (void)cancel
{
    if (_requestOperation) {
        
        [_requestOperation cancel];
        _requestOperation = nil;
    }
}

- (void)startShowHUD
{
    UIView * view = (UIView*)[[[UIApplication sharedApplication]delegate]window];
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}
- (void)dismissHUD
{
    UIView * view = (UIView*)[[[UIApplication sharedApplication]delegate]window];
    [MBProgressHUD hideHUDForView:view animated:YES];
}
@end
