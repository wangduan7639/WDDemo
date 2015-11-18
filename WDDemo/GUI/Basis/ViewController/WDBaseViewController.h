//
//  WDBaseViewController.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WDViewModel;
@interface WDBaseViewController : UIViewController

//子类继承。
- (instancetype) initViewModel:(WDViewModel *)viewModel;
//子类重写继承
- (void)setupViews;
//子类重写继承
- (void)setupViewModel;

@end
