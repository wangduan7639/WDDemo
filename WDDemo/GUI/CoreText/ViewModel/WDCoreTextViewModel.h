//
//  WDCoreTextViewModel.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDViewModel.h"

@interface WDCoreTextViewModel : WDViewModel

@property (nonatomic, strong)RACCommand *htmlCommand;
@property (nonatomic, strong)RACCommand *coreTextCommand;

@end
