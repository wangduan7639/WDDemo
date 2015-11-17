//
//  UIView+Tool.m
//  WindStock
//
//  Created by ZhengShixi on 15/6/13.
//  Copyright (c) 2015年 ZhangLei. All rights reserved.
//

#import "UIView+Tool.h"

@implementation UIView (Tool)
+ (UIView*) getViewWithFrame: (CGRect) frame backGroudColor: (UIColor*) bgColor
{
    UIView* aView = [[UIView alloc] initWithFrame: frame];

    aView.backgroundColor = bgColor;
    return aView;
}

@end
