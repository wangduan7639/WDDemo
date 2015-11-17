//
//  WDRACTestViewController.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDRACTestViewController.h"
#import "WDRACTestViewModel.h"

@interface WDRACTestViewController ()

@end

@implementation WDRACTestViewController

- (instancetype)initViewModel:(id)viewModel
{
    if (self = [super initViewModel:viewModel]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupViews
{

}

- (void)setupViewModel
{
    RAC(self, title) = RACObserve(self.viewModel, title);
}

@end
