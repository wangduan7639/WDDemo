//
//  WDReceiveWatchEngine.h
//  WDDemo
//
//  Created by wd on 15/11/24.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDReceiveWatchEngine : NSObject

+ (instancetype)instance;

- (void)receiveWatchRequest:(NSDictionary *)userInfo withReply:(void (^)(NSDictionary *))reply;
@end
