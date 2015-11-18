//
//  WDNetworkViewModel.m
//  WDDemo
//
//  Created by wd on 15/11/17.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkViewModel.h"
#import "WDNetworkTestService.h"
#import "WDRequestURL.h"

@interface WDNetworkViewModel ()

@property (nonatomic, strong) WDNetworkTestService  *networkTestService;
@property (nonatomic, strong) WDHttpRequestHandler  *httpRequestHandle;

@end

@implementation WDNetworkViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"AFNetworkTest";
        _networkTestService = [WDNetworkTestService defaultService];
        [self setupCommands];
    }
    return self;
}

- (void)setupCommands
{
    @weakify(self);
    _getProduceCodeCommand = [[RACCommand alloc]
                              initWithSignalBlock: ^RACSignal*(NSString * input) {
                                  @strongify(self);
                                  self.phoneNumber = input;
                                  [self requestCode];
                                  return [RACSignal empty];
                              }];

}

- (void)requestCode
{
    if (self.httpRequestHandle) {
        [self.httpRequestHandle cancel];
    }
    self.httpRequestHandle = [_networkTestService wd_requestWithURL:[[WDRequestURL instance] urlWithRequestTag:WDRequestTag_GetProduceCode] methodType:WDHttpMethodTypeGet params:@{@"mobile":self.phoneNumber, @"type":@"1",} successBlock:^(WDModel *model) {
        
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"success:%@",model.status]];

     } failureBlock:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus: error.localizedDescription maskType:SVProgressHUDMaskTypeNone];
     } showHUD:YES];
}
@end
