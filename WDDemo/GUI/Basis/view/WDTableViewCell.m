//
//  WDTableViewCell.m
//  WDDemo
//
//  Created by wd on 15/11/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDTableViewCell.h"

@implementation WDTableViewCell

- (void) cellWillAppear
{
    [super cellWillAppear];
    self.separatorInset = UIEdgeInsetsZero;
    self.layoutMargins = UIEdgeInsetsZero;
    self.preservesSuperviewLayoutMargins = NO;
}


@end
