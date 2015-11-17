//
//  YXNetworkTestService_RAC.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXNetworkService_RAC.h"

@interface YXNetworkTestService_RAC : YXNetworkService_RAC
- (RACSignal*) yxrac_xxxxxxxxWithId: (NSString*) xxId;
//请求验证码例子
- (RACSignal*) yxrac_getProduceCodeWithPhoneNumber:(NSString *)phone type:(NSString *)type;
//上传头像例子
- (RACSignal*) yxrac_updateImageWithImage:(UIImage *)image;

//请求验证码例子
- (RACSignal*) yxrac_getWeekRank;
@end
