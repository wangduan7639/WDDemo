//
//  WDCoreTextViewController.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDCoreTextViewController.h"
#import "WDCoreTextViewModel.h"

@interface WDCoreTextViewController ()

@property (nonatomic, strong) WDCoreTextViewModel   *viewModel;
@property (nonatomic, strong) UIButton  *htmlButton;
@property (nonatomic, strong) UIButton  *coreTextButton;

@end

@implementation WDCoreTextViewController

- (instancetype)initViewModel:(WDViewModel *)viewModel
{
    if (self = [super initViewModel:viewModel]) {
        _viewModel = (WDCoreTextViewModel *)viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupViews
{
    [super setupViews];
    self.htmlButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.htmlButton.backgroundColor = [UIColor clearColor];
    [self.htmlButton setTitle:@"html" forState:UIControlStateNormal];
    [self.htmlButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.htmlButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.view addSubview:self.htmlButton];
    [self.htmlButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    self.coreTextButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.coreTextButton.backgroundColor = [UIColor clearColor];
    [self.coreTextButton setTitle:@"coreText" forState:UIControlStateNormal];
    [self.coreTextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.coreTextButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.view addSubview:self.coreTextButton];
    [self.coreTextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.htmlButton.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

- (void)setupViewModel
{
    [super setupViewModel];
    self.htmlButton.rac_command = self.viewModel.htmlCommand;
    self.coreTextButton.rac_command = self.viewModel.coreTextCommand;
}

@end
