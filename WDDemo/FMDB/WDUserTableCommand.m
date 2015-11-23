//
//  WDUserTable.m
//  WDDemo
//
//  Created by wd on 15/11/20.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDUserTableCommand.h"
#import "NSObject+FMDB.h"

@implementation WDUserTable


+ (NSString *)tableName
{
    return @"WDUser";
}
@end

@implementation WDUserTableCommand

- (instancetype)init
{
    if (self = [super init]) {
        [self createWDUserTable];
    }
    return self;
}

- (BOOL)createWDUserTable
{
    if ([self tableExists:[WDUserTable tableName]]) {
        return YES;
    }
    NSString *sql = [[NSString alloc] initWithFormat:@"CREATE TABLE '%@'('userId' VARCHAR(30) , 'userName' VARCHAR(64) , 'userDesc' VARCHAR(255))", [WDUserTable tableName]];
    return [self createTable:sql];
}
- (BOOL)removeObject:(WDUserTable *)obj
{
    return [self removeObject:obj where:[NSString stringWithFormat:@"%@='%@'", @"userId", obj.userId]];
}
@end