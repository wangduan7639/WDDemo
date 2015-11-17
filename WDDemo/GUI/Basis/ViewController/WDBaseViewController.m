//
//  WDBaseViewController.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDBaseViewController.h"

@interface WDBaseViewController ()

@end

@implementation WDBaseViewController
- (instancetype) initViewModel:(WDViewModel *)viewModel
{
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
    [self setupViewModel];
}

- (void)setupViews
{

}

- (void)setupViewModel
{
    
}

@end
