//
//  WDReceiveWatchEngine.m
//  WDDemo
//
//  Created by wd on 15/11/24.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDReceiveWatchEngine.h"

@implementation WDReceiveWatchEngine

+ (instancetype)instance
{
    static WDReceiveWatchEngine *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WDReceiveWatchEngine alloc] init];
    });
    
    return _sharedInstance;
}
- (void)receiveWatchRequest:(NSDictionary *)userInfo withReply:(void (^)(NSDictionary *))reply
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];

    NSString *value = [userInfo objectForKey:@"key"];
    if ([value isEqualToString:@"table"]) {
        [result setValue:@[@"1",@"2"] forKey:@"table"];
    }
}

@end
