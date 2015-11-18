//
//  WDCoreTextLabel.m
//  WDDemo
//
//  Created by wd on 15/11/18.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDCoreTextLabel.h"

@implementation WDCoreTextLabel

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (self.heightChangeBlock) {
        self.heightChangeBlock(self);
    }
}

@end
