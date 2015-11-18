//
//  WDNetworkViewModel.h
//  WDDemo
//
//  Created by wd on 15/11/17.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDViewModel.h"

@interface WDNetworkViewModel : WDViewModel
@property (nonatomic, strong, readonly)RACCommand *getProduceCodeCommand;
@property (nonatomic, strong) NSString  *phoneNumber;

@end
