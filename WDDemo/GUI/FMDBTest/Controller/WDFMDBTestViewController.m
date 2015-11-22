//
//  WDFMDBTestViewController.m
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDFMDBTestViewController.h"
#import "WDFMDBViewModel.h"
#import "WDFMDBTableViewCell.h"
#import "WDFMDBTableViewItem.h"

@interface WDFMDBTestViewController ()<RETableViewManagerDelegate>

@property (nonatomic, strong) WDFMDBViewModel   * viewModel;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) RETableViewManager    *tableViewManager;
@property (nonatomic, strong) RETableViewSection    *tableViewSection;

@end

@implementation WDFMDBTestViewController

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

- (void)setupViews
{
    [super setupViews];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewManager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.tableViewSection = [RETableViewSection section];
    [self.tableViewManager addSection:self.tableViewSection];
    self.tableViewManager[@"WDFMDBTableViewItem"] = @"WDFMDBTableViewCell";
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    rightItem.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        //TODO
        return [RACSignal empty];
    }];
}

- (void)setupViewModel
{
    [super setupViewModel];
    RAC(self,title) = RACObserve(self.viewModel, title);
    [[[RACObserve(self.viewModel, userArray) switchToLatest] deliverOnMainThread] subscribeNext:^(NSArray * array) {
        //TODO
    }];
}

@end
