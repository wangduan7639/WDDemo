//
//  WDFMDBAddViewController.m
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDFMDBAddViewController.h"
#import "WDFMDBViewModel.h"

@interface WDFMDBAddViewController ()

@property (nonatomic,strong) WDFMDBViewModel    *viewModel;

@end

@implementation WDFMDBAddViewController

- (instancetype)initViewModel:(WDViewModel *)viewModel
{
    if (self = [super initViewModel:viewModel]) {
        _viewModel = (WDFMDBViewModel *)viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
