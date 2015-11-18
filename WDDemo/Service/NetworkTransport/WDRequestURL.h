//
//  WDRequestURL.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDNetworkDefine.h"

@interface WDRequestURL : NSObject
//默认NO
@property (assign, nonatomic) BOOL isTestAPI;
@property (readonly, nonatomic) NSString* WDBaseUrl;
@property (readonly, nonatomic) NSString* WD2BaseUrl;

+ (instancetype) instance;
- (NSString *)urlWithRequestTag:(WDRequestTag)tag;

@end
