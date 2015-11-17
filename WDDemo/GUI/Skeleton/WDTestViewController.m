//
//  ViewController.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDTestViewController.h"
#import "WDNavigationManager.h"
#import "WDRACTestViewModel.h"
#import "WDRACTestViewController.h"

@interface WDTestViewController ()<RETableViewManagerDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) RETableViewManager    *tableViewManager;
@property (nonatomic, strong) RETableViewSection    *tableViewSection;

@end

@implementation WDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Test";
    [self setupViews];
}

- (void)setupViews
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableViewManager = [[RETableViewManager alloc] initWithTableView:self.tableView delegate:self];
    self.tableViewSection = [RETableViewSection section];
    [self.tableViewManager addSection:self.tableViewSection];
    
    @weakify(self);
    RETableViewItem * item = [RETableViewItem itemWithTitle:@"RACTest"
                                              accessoryType:UITableViewCellAccessoryDisclosureIndicator
                                           selectionHandler:^(RETableViewItem *item) {
                                               @strongify(self);
                                               UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:item.indexPath];
                                               cell.selected = NO;
                                               WDRACTestViewModel * viewModel = [[WDRACTestViewModel alloc] init];
                                               WDRACTestViewController * viewController = [[WDRACTestViewController alloc] initViewModel:viewModel];
                                               [[WDNavigationManager sharedManager] pushViewController:viewController];
                                           }];
    [self.tableViewSection addItem:item];
}

@end
