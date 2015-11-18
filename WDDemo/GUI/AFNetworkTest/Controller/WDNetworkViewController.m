//
//  WDNetworkViewController.m
//  WDDemo
//
//  Created by wd on 15/11/17.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNetworkViewController.h"
#import "WDNetworkViewModel.h"

@interface WDNetworkViewController ()

@property (nonatomic, strong) WDNetworkViewModel    *viewModel;
@property (nonatomic, strong)UITextField* phoneTextField;
@property (nonatomic, strong)UIButton  * getProduceCodeButton;

@end

@implementation WDNetworkViewController
- (instancetype)initViewModel:(WDViewModel *)viewModel
{
    if (self = [super initViewModel:viewModel]) {
        _viewModel = (WDNetworkViewModel *)viewModel;
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
    self.phoneTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.phoneTextField.textAlignment = NSTextAlignmentCenter;
    self.phoneTextField.placeholder = @"请输入手机号";
    self.phoneTextField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.phoneTextField];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    self.getProduceCodeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.getProduceCodeButton.backgroundColor = [UIColor clearColor];
    [self.getProduceCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getProduceCodeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.getProduceCodeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [self.view addSubview:self.getProduceCodeButton];
    [self.getProduceCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

- (void)setupViewModel
{
    [super setupViewModel];
    @weakify(self);
    self.getProduceCodeButton.rac_command = [[RACCommand alloc] initWithEnabled:[RACSignal combineLatest:@[self.phoneTextField.rac_textSignal] reduce:^(NSString * text){
        return @(text && text.length > 0);
    }] signalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.viewModel.getProduceCodeCommand execute:self.phoneTextField.text];
        return [RACSignal empty];
    }];
}
@end
