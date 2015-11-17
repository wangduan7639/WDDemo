//
//  WDViewModel.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDNavigationManager;
@interface WDViewModel : NSObject

@property (nonatomic, strong)WDNavigationManager    *navigationManager;
@property (nonatomic, copy)NSString     *title;

@end
