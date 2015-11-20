//
//  WDWebTestViewModel.m
//  WDDemo
//
//  Created by wd on 15/11/20.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDWebTestViewModel.h"
#import "WDWebViewViewController.h"

@implementation WDWebTestViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"WebTest";
        [self setupCommands];
    }
    return self;
}
- (void)setupCommands
{
    @weakify(self);
    _gotoWebViewCommand = [[RACCommand alloc]
                              initWithSignalBlock: ^RACSignal*(NSString * input) {
                                  @strongify(self);
                                  WDWebViewViewController * webController = [[WDWebViewViewController alloc] initWithUrlString:input];
                                  [self.navigationManager pushViewController:webController];
//                                  [self.navigationManager presentViewControllerView:webController];
                                  return [RACSignal empty];
                              }];

}
@end
