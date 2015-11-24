//
//  WDWatchDataEngine.h
//  WDDemo
//
//  Created by wd on 15/11/24.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDWatchDataEngine : NSObject

+ (instancetype)instance;

- (void)getTableList:(void(^)(NSDictionary *replyInfo, NSError *error))reply;
- (void)showAlert:(void(^)(NSDictionary *replyInfo, NSError *error))reply;
@end
