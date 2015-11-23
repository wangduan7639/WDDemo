//
//  WDFMDBViewModel.h
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDViewModel.h"

@class WDUserTable;
@interface WDFMDBViewModel : WDViewModel

@property (nonatomic, strong) RACCommand    *searchUserCommand;
@property (nonatomic, strong) RACCommand    *addCommand;
@property (nonatomic, strong) RACCommand    *addCompleteCommand;
@property (nonatomic, strong) NSMutableArray    *userArray;
@property (nonatomic, copy) NSString    *userId;
@property (nonatomic, copy) NSString    *userName;
@property (nonatomic, copy) NSString    *userDesc;

- (BOOL)deleteUser:(WDUserTable *)user;
@end
