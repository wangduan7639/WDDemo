//
//  WDNetworkService_RAC.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDNetworkService_RAC : NSObject
+ (instancetype) defaultService;
@property (nonatomic, strong, readonly) AFHTTPRequestOperationManager* client;
@end
