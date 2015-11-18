//
//  WDCoreTextLabel.h
//  WDDemo
//
//  Created by wd on 15/11/18.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <CoreTextLabel/CoreTextLabel.h>

@interface WDCoreTextLabel : CoreTextLabel

@property (nonatomic, copy) void (^heightChangeBlock)(UIView * textLabel);

@end
