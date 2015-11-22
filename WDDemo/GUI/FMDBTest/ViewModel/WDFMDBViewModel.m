//
//  WDFMDBViewModel.m
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDFMDBViewModel.h"
#import "WDUserTableCommand.h"

@interface WDFMDBViewModel ()

@property (nonatomic, strong) WDUserTableCommand    *userCommand;

@end

@implementation WDFMDBViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"FMDBTest";
        _userCommand = [WDUserTableCommand instance];
    }
    return self;
}
@end
