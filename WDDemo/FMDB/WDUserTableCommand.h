//
//  WDUserTable.h
//  WDDemo
//
//  Created by wd on 15/11/20.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDFMDBManager.h"

@interface WDUserTable : NSObject

@property (nonatomic, copy) NSString    *userId;
@property (nonatomic, copy) NSString    *userName;
@property (nonatomic, copy) NSString    *userDesc;

+ (NSString *)tableName;
@end

@interface WDUserTableCommand : WDFMDBManager

@end