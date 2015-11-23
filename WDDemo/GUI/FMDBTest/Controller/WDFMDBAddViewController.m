//
//  WDFMDBAddViewController.m
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDFMDBAddViewController.h"
#import "WDFMDBViewModel.h"

@interface WDFMDBAddViewController ()<RETableViewManagerDelegate>

@property (nonatomic, strong) WDFMDBViewModel    *viewModel;
@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) RETableViewManager    *tableViewManager;
@property (nonatomic, strong) RETableViewSection    *tableViewSection;

@property (nonatomic, strong) RETextItem    *idItem;
@property (nonatomic, strong) RETextItem    *nameItem;
@property (nonatomic, strong) RETextItem    *descItem;

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

- (void)setupViews
{
    [super setupViews];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    rightItem.rac_command = self.viewModel.addCompleteCommand;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewManager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.tableViewSection = [RETableViewSection section];
    [self.tableViewManager addSection:self.tableViewSection];
    
    self.idItem = [RETextItem itemWithTitle:@"ID:" value:nil placeholder:@"请输入用户ID"];
    [self.tableViewSection addItem:self.idItem];
    
    self.nameItem = [RETextItem itemWithTitle:@"Name:" value:nil placeholder:@"请输入用户Name"];
    [self.tableViewSection addItem:self.nameItem];
    
    self.descItem = [RETextItem itemWithTitle:@"Desc:" value:nil placeholder:@"请输入用户Desc"];
    [self.tableViewSection addItem:self.descItem];

}

- (void)setupViewModel
{
    [super setupViewModel];
    RAC(self.viewModel, userId) = RACObserve(self.idItem, value);
    RAC(self.viewModel, userName) = RACObserve(self.nameItem, value);
    RAC(self.viewModel, userDesc) = RACObserve(self.descItem, value);
}

@end
