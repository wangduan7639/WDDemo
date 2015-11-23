//
//  WDJSPatchTestViewModel.m
//  WDDemo
//
//  Created by wd on 15/11/23.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDJSPatchTestViewModel.h"

@implementation WDJSPatchTestViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"JSPatchTest";
        [self setupData];
    }
    return self;
}

- (void)setupData
{
    _dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 20; i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"我是 %d",i + 1]];
    }
}
@end
