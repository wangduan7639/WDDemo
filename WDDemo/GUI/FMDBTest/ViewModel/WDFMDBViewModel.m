//
//  WDFMDBViewModel.m
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDFMDBViewModel.h"
#import "WDUserTableCommand.h"
#import "WDFMDBAddViewController.h"

@interface WDFMDBViewModel ()

@property (nonatomic, strong) WDUserTableCommand    *userCommand;

@end

@implementation WDFMDBViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"FMDBTest";
        _userCommand = [WDUserTableCommand instance];
        [self setupCommand];
    }
    return self;
}

- (void)setupCommand
{
    @weakify(self);
    _searchUserCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        NSMutableArray * userTableArray = [_userCommand query:[WDUserTable tableName]];
        NSMutableArray * newUserArray = [[NSMutableArray alloc] init];
        if (userTableArray && [userTableArray count] > 0) {
            [userTableArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                WDUserTable * user = [[WDUserTable alloc] initWithDictionary:obj];
                [newUserArray addObject:user];
            }];
        }
        self.userArray = newUserArray;
        return [RACSignal empty];
    }];
    
    _addCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        WDFMDBAddViewController * viewController = [[WDFMDBAddViewController alloc] initViewModel:self];
        [self.navigationManager pushViewController:viewController];
        return [RACSignal empty];
    }];
    
    _addCompleteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [[self.navigationManager navigationController] popViewControllerAnimated:YES];
        WDUserTable * user = [[WDUserTable alloc] init];
        user.userId = self.userId;
        user.userName = self.userName;
        user.userDesc = self.userDesc;
        
        BOOL success = [_userCommand insertObject:user];
        if (success) {
            [SVProgressHUD showErrorWithStatus:@"Add Success"];
            [self.searchUserCommand execute:nil];
        }else{
            [SVProgressHUD showErrorWithStatus:@"Add Failture"];
        }
        return [RACSignal empty];
    }];
    [_searchUserCommand execute:nil];
    
}

- (BOOL)deleteUser:(WDUserTable *)user
{
    BOOL success = [_userCommand removeObject:user];
    if (success) {
        [SVProgressHUD showErrorWithStatus:@"Add Success"];
    }else{
        [SVProgressHUD showErrorWithStatus:@"Add Failture"];
    }
    return success;
}
@end
