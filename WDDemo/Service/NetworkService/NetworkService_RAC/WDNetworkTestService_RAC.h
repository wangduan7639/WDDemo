//
//  WDNetworkTestService_RAC.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkService_RAC.h"

@interface WDNetworkTestService_RAC : WDNetworkService_RAC
- (RACSignal*)wdrac_xxxxxxxxWithId: (NSString*) xxId;
//请求验证码例子
- (RACSignal*)wdrac_getProduceCodeWithPhoneNumber:(NSString *)phone type:(NSString *)type;
//上传头像例子
- (RACSignal*)wdrac_updateImageWithImage:(UIImage *)image;

//请求验证码例子
- (RACSignal*)wdrac_getWeekRank;
@end
