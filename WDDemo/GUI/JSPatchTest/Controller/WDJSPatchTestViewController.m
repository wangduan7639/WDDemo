//
//  WDJSPatchTestViewController.m
//  WDDemo
//
//  Created by wd on 15/11/23.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDJSPatchTestViewController.h"
#import "WDJSPatchTestViewModel.h"

@interface WDJSPatchTestViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) WDJSPatchTestViewModel    *viewModel;
@property (nonatomic, strong) UITableView   *tableView;

@end

@implementation WDJSPatchTestViewController

- (instancetype)initViewModel:(WDViewModel *)viewModel
{
    if (self = [super initViewModel:viewModel]) {
        _viewModel = (WDJSPatchTestViewModel *)viewModel;
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (void)setupViewModel
{
    [super setupViewModel];
    RAC(self, title) = RACObserve(self.viewModel, title);
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifierCell = @"identifierCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierCell];
    }
    cell.textLabel.text = [self.viewModel.dataArray objectAtIndex:indexPath.row];
    cell.highlighted = NO;
    return cell;
}

@end
