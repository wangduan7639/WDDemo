//
//  WDRACTestViewModel.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDRACTestViewModel.h"

@implementation WDRACTestViewModel

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"RACTest";
        [self setupCommand];
    }
    return self;
}

- (void)setupCommand
{
    [self arrayRAC_sequence];
}

//数组的遍历。
- (void)arrayRAC_sequence
{
    [[@[@"you", @"are", @"beautiful"] rac_sequence].signal subscribeNext:^(id x) {
        NSLog(@"---------%@",x);
    }];
    
    [[[@[@"you", @"are", @"beautiful"] rac_sequence].signal map:^id(NSString * value) {
        return [value capitalizedString];
    }] subscribeNext:^(id x) {
        NSLog(@"capitalizedString -------%@",x);
    }];
}

//信号开关。
- (void)signalSwitch
{
    //创建3个自定义信号
    RACSubject *google = [RACSubject subject];
    RACSubject *baidu = [RACSubject subject];
    RACSubject *signalOfSignal = [RACSubject subject];
    
    //获取开关信号
    RACSignal *switchSignal = [signalOfSignal switchToLatest];
    
    //对通过开关的信号量进行操作
    [[switchSignal  map:^id(NSString * value) {
        return [@"https//www." stringByAppendingFormat:@"%@", value];
    }] subscribeNext:^(NSString * x) {
        NSLog(@"%@", x);
    }];
    
    //通过开关打开baidu
    [signalOfSignal sendNext:baidu];
    [baidu sendNext:@"baidu.com"];
    [google sendNext:@"google.com"];
    
    //通过开关打开google
    [signalOfSignal sendNext:google];
    [baidu sendNext:@"baidu.com/"];
    [google sendNext:@"google.com/"];
}
//信号组合，，组合信号。
- (void)combiningLatest
{
    RACSubject * letters = [RACSubject subject];
    RACSubject * numbers = [RACSubject subject];
    [[RACSignal combineLatest:@[letters, numbers] reduce:^(NSString * letter, NSString * number){
        return [number stringByAppendingString:letter];
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];
}
//信号合并
- (void)signalMerge
{
    RACSubject * letters = [RACSubject subject];
    RACSubject * numbers = [RACSubject subject];
    RACSubject * chinese = [RACSubject subject];
    
    [[RACSignal merge:@[letters, numbers, chinese]] subscribeNext:^(id x) {
        NSLog(@"merge:%@", x);
    }];
    
    [numbers sendNext:@"123456789"];
    [letters sendNext:@"abcdefghijklmn"];
    [chinese sendNext:@"我是你大爷！"];
}

@end
