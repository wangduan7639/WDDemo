//
//  WDFMDBViewModel.h
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDViewModel.h"

@interface WDFMDBViewModel : WDViewModel

@property (nonatomic, copy) RACCommand  * searchUserCommand;
@property (nonatomic, strong) NSMutableArray    *userArray;

@end
