//
//  WDNavigationManager.m
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDNavigationManager.h"
#import "WDViewModel.h"
#import "WDBaseViewController.h"

@interface WDNavigationManager ()

@property (nonatomic, strong) NSMutableArray* navigationControllerStack;

- (UINavigationController*)navigationController;

@end

@implementation WDNavigationManager

+ (WDNavigationManager*)sharedManager
{
    static dispatch_once_t once;
    static id instance = nil;
    
    dispatch_once (&once, ^{ instance = [[self alloc] init]; });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _navigationControllerStack = [[NSMutableArray alloc] initWithCapacity: 1];
    }
    return self;
}

- (UINavigationController*)navigationController
{
    return self.navigationControllerStack.lastObject;
}

- (void)pushNavigationController: (UINavigationController*) navigationController
{
    [self.navigationControllerStack addObject: navigationController];
}

- (void)presentViewControllerView:(WDBaseViewController *)viewController
{
    UINavigationController* navigationController =
    [[UINavigationController alloc] initWithRootViewController: viewController];
    
    [self.rootViewController presentViewController: navigationController animated: YES completion: nil];
    [self pushNavigationController: navigationController];
}

- (UINavigationController*) dismissNavigationController
{
    UINavigationController* navigationController = self.navigationControllerStack.lastObject;
    
    [self.navigationControllerStack removeLastObject];
    return navigationController;
}

- (void)pushViewController:(WDBaseViewController *)viewController
{
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
