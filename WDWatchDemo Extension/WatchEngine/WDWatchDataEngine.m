//
//  WDWatchDataEngine.m
//  WDDemo
//
//  Created by wd on 15/11/24.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDWatchDataEngine.h"
#import <WatchConnectivity/WatchConnectivity.h>

@implementation WDWatchDataEngine

+ (instancetype)instance
{
    static WDWatchDataEngine *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WDWatchDataEngine alloc] init];
    });
    
    return _sharedInstance;
}

- (void)openParentApplication:(NSDictionary *)dict reply:(void (^)(NSDictionary *, NSError *))reply {
    
    [[WCSession defaultSession] sendMessage:dict replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {
        if (reply) {
            reply(replyMessage,nil);
        }
    } errorHandler:^(NSError * _Nonnull error) {
        if (reply) {
            reply(nil,error);
        }
    }];
    
}

- (void)getTableList:(void(^)(NSDictionary *replyInfo, NSError *error)) reply
{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"table", @"key",  nil];
    [self openParentApplication:dict
                          reply:reply];
}

- (void)showAlert:(void(^)(NSDictionary *replyInfo, NSError *error))reply
{
    
}
@end
