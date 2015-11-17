//
//  YXNetworkTestService_RAC.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXNetworkTestService_RAC.h"
#import "YXModel.h"

@implementation YXNetworkTestService_RAC
+ (instancetype) defaultService
{
    static YXNetworkTestService_RAC* _defaultService = nil;
    static dispatch_once_t _onceToken = 0;
    
    dispatch_once (&_onceToken, ^{
        _defaultService = [[self alloc] init];
    });
    return _defaultService;
}
- (RACSignal*) yxrac_xxxxxxxxWithId: (NSString*) xxId
{
    static NSInteger i = 0;
    NSString * str = [NSString stringWithFormat:@"%ld",i++];
    return [RACSignal return : str];
/*
    xxId = [NSString getSafeStringWithString:xxId];
    
    RACSignal* signal = nil;
    
    
    signal = [self.client rac_GET:@"/xxid/..."
                                  parameters: @{
                                                @"xxId": xxId,
                                                }];
    
    signal = [signal
              flattenMap: ^RACStream*(RACTuple* tuple) {
                  NSDictionary* json = tuple.first;
                  if (!json) {
                      return [RACSignal error: nil];
                  }
                  YXModel* m = [[YXModel alloc] initWithDictionary:json error:nil];
                  return [RACSignal return : m];
              }];
    
    [signal catch:^RACSignal *(NSError *error) {
        return [RACSignal error: error];
    }];
    return signal;
*/
}

- (RACSignal*) yxrac_getProduceCodeWithPhoneNumber:(NSString *)phone type:(NSString *)type
{
    phone = [NSString getSafeStringWithString:phone];
    type = [NSString getSafeStringWithString:type];
    
    RACSignal* signal = nil;
    
    
    signal = [self.client rac_GET:@"/app/user/produceCode.do"
                       parameters: @{
                                     @"mobile": phone,
                                     @"type":type,
                                     }];
    
    signal = [signal
              flattenMap: ^RACStream*(RACTuple* tuple) {
                  NSDictionary* json = tuple.first;
                  if (!json) {
                      return [RACSignal error: nil];
                  }
                  YXModel* m = [[YXModel alloc] initWithDictionary:json error:nil];
                  return [RACSignal return : m];
              }];
    
    [signal catch:^RACSignal *(NSError *error) {
        return [RACSignal error: error];
    }];
    return signal;
}

- (RACSignal*) yxrac_updateImageWithImage:(UIImage *)image
{
    if (!image) {
        return [RACSignal error: [NSError errorWithDomain: @"mobile.hwk.yanxiu.com" code: -1 userInfo: @{ NSLocalizedDescriptionKey: @"空图像" }]];
    }
    @weakify(self);
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify (self);
        NSString* imageName = [NSString stringWithFormat: @"image%d.jpg", (int) ([[NSDate date] timeIntervalSince1970] / 1)];
        NSData* data = UIImageJPEGRepresentation (image, 1.0f);
        NSError* error = nil;
        AFHTTPRequestSerializer* serializer = self.client.requestSerializer;
        NSString* baseUrlString = self.client.baseURL.absoluteString;
        NSString* absUrlString = [baseUrlString stringByAppendingString: @"/user/updateimg"];
        NSMutableURLRequest* request = [serializer multipartFormRequestWithMethod: @"POST"
                                                                        URLString: absUrlString
                                                                       parameters: @{
                                                                                     @"token": @"testToken",
                                                                                     }
                                                        constructingBodyWithBlock: ^(id<AFMultipartFormData> formData) {
                                                            [formData appendPartWithFileData: data name: @"user_img" fileName: imageName mimeType: @"image/jpg"];
                                                        }
                                                                            error: &error];
        AFHTTPRequestOperation* operation =[self.client HTTPRequestOperationWithRequest: request
                                                 success: ^(AFHTTPRequestOperation* operation, id responseObject) {
                                                     [subscriber sendNext: [RACTuple tupleWithObjects: responseObject, operation, nil]];
                                                     [subscriber sendCompleted];
                                                 }
                                                 failure: ^(AFHTTPRequestOperation* operation, NSError* error) {
                                                     [subscriber sendError: error];
                                                 }];
        [self.client.operationQueue addOperation: operation];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];

    signal = [signal flattenMap: ^RACStream*(RACTuple* tuple) {
        NSDictionary* json = tuple.first;
        if (!json) {
            return [RACSignal error: nil];
        }
        YXModel* m = [[YXModel alloc] initWithDictionary:json error:nil];
        return [RACSignal return : m];
    }];
    [signal catch:^RACSignal *(NSError *error) {
        return [RACSignal error: error];
    }];
    return signal;
}

- (RACSignal*) yxrac_getWeekRank
{
    RACSignal* signal = nil;
    
    
    signal = [self.client rac_GET:@"/app/q/weekRank.do"
                       parameters: @{
                                     @"osType": @"0",
                                     @"token":@"2c2f34462b13004cdd18d6c196904c38",
                                     @"appVersion":@"1.1",
                                     }];
    
    signal = [signal
              flattenMap: ^RACStream*(RACTuple* tuple) {
                  NSDictionary* json = tuple.first;
                  if (!json) {
                      return [RACSignal error: nil];
                  }
                  YXModel* m = [[YXModel alloc] initWithDictionary:json error:nil];
                  return [RACSignal return : m];
              }];
    
    [signal catch:^RACSignal *(NSError *error) {
        return [RACSignal error: error];
    }];
    return signal;

}
@end
