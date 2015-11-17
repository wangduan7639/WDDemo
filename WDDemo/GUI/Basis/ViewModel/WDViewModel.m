//
//  WDViewModel.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDViewModel.h"
#import "WDNavigationManager.h"

@implementation WDViewModel

- (instancetype)init
{
    if (self = [super init]) {
        _title = @"";
        _navigationManager = [WDNavigationManager sharedManager];
    }
    return self;
}

@end
