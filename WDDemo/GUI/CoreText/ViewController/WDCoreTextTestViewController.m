//
//  WDCoreTextTestViewController.m
//  WDDemo
//
//  Created by wd on 15/11/18.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDCoreTextTestViewController.h"
#import "WDHtmlTableItem.h"

@interface WDCoreTextTestViewController ()<RETableViewManagerDelegate>

@property (nonatomic, strong) UITableView   *tableView;
@property (nonatomic, strong) RETableViewManager    *tableViewManager;
@property (nonatomic, strong) RETableViewSection    *tableViewSection;

@end

@implementation WDCoreTextTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    self.tableViewManager[@"WDHtmlTableItem"] = @"WDHtmlTableCell";

    
    WDHtmlTableItem * item = [WDHtmlTableItem itemWithTitle:nil
                                              accessoryType:UITableViewCellAccessoryNone
                                           selectionHandler:^(RETableViewItem *item) {
                                               
                                           }];
    item.htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    [self.tableViewSection addItem:item];
    
    item = [WDHtmlTableItem itemWithTitle:nil accessoryType:UITableViewCellAccessoryNone selectionHandler:^(RETableViewItem *item) {
        
    }];
    item.htmlString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Image" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
    [self.tableViewSection addItem:item];
}


@end
