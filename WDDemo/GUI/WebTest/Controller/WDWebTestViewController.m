//
//  WDWebTestViewController.m
//  WDDemo
//
//  Created by wd on 15/11/20.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDWebTestViewController.h"
#import "WDWebTestViewModel.h"

@interface WDWebTestViewController ()

@property (nonatomic, strong) WDWebTestViewModel    *viewModel;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) UIButton * goButton;

@end

@implementation WDWebTestViewController

- (instancetype)initViewModel:(WDViewModel *)viewModel
{
    if (self = [super initViewModel:viewModel]) {
        _viewModel = (WDWebTestViewModel *)viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}

- (void)setupViews
{
    [super setupViews];
    self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入网址";
    [self.view addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(30);
        make.top.equalTo(self.view).with.offset(80);
    }];
    
    self.goButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.goButton setTitle:@"Go" forState:UIControlStateNormal];
    self.goButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.goButton];
    [self.goButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
        make.top.equalTo(self.textField.mas_bottom).with.offset(20);
    }];
}

- (void)setupViewModel
{
    [super setupViewModel];
    @weakify(self);
    self.goButton.rac_command = [[RACCommand alloc] initWithEnabled:[self.textField.rac_textSignal map:^id(NSString * text) {
        return @(text && text.length > 0);
    }] signalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSString * urlString = self.textField.text;
        if (![urlString hasPrefix:@"http://"]) {
            urlString = [NSString stringWithFormat:@"http://%@",urlString];
        }
        [self.viewModel.gotoWebViewCommand execute:urlString];
        return [RACSignal empty];
    }];

}
@end
