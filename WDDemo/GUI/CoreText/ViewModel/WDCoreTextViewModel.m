//
//  WDCoreTextViewModel.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDCoreTextViewModel.h"
#import "WDHtmlViewController.h"
#import "WDCoreTextTestViewController.h"

@implementation WDCoreTextViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"AFNetworkTest";
        [self setupCommands];
    }
    return self;
}

- (void)setupCommands
{
    @weakify(self);
    _htmlCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        WDHtmlViewController * viewController = [[WDHtmlViewController alloc] init];
        [self.navigationManager pushViewController:viewController];
        return [RACSignal empty];
    }];
    
    _coreTextCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        WDCoreTextTestViewController * viewController = [[WDCoreTextTestViewController alloc] init];
        [self.navigationManager pushViewController:viewController];
        return [RACSignal empty];
    }];
}

@end
