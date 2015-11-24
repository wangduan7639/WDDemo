//
//  WDTableInterfaceController.m
//  WDDemo
//
//  Created by wd on 15/11/24.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDTableInterfaceController.h"
#import "WDWatchDataEngine.h"

@interface WDTableInterfaceController ()

@property (nonatomic, strong) NSArray   *tableArray;

@end

@implementation WDTableInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    self.tableArray = [NSArray array];
    [[WDWatchDataEngine instance] getTableList:^(NSDictionary *replyInfo, NSError *error) {
        self.tableArray = replyInfo[@"table"];
        [self.table setNumberOfRows:self.tableArray.count withRowType:@"NSObject"];
    }];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setObject:@"alert" forKey:@"Notification"];
    [self updateUserActivity:@"WDWatch" userInfo:userInfo webpageURL:nil];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



