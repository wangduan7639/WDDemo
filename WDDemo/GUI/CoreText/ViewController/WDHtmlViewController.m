//
//  WDHtmlViewController.m
//  WDDemo
//
//  Created by wd on 15/11/18.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDHtmlViewController.h"
#import "WDCoreTextLabel.h"

@interface WDHtmlViewController ()

@property (nonatomic, strong) WDCoreTextLabel *textLabel;
@property (nonatomic, strong) UIScrollView  *bgScrollView;

@end

@implementation WDHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.bgScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIFont * regularFont = [UIFont fontWithName:@"Verdana" size:18];
    UIFont * boldFont = [UIFont fontWithName:@"Verdana-Bold" size:18];
    UIFont * italicFont = [UIFont fontWithName:@"Verdana-Italic" size:18];
    UIFont * boldItalicFont = [UIFont fontWithName:@"Verdana-BoldItalic" size:18];
    
    UIColor * boldTextColor = [UIColor blueColor];
    UIColor * boldItalicTextColor = [UIColor redColor];
    UIColor * italicTextColor = [UIColor yellowColor];
    
    self.textLabel = [[WDCoreTextLabel alloc] initWithFrame:CGRectZero];
    [self.bgScrollView addSubview:self.textLabel];
    self.textLabel.defaultFontSize = 18;
    self.textLabel.font = regularFont;
    self.textLabel.boldFont = boldFont;
    self.textLabel.italicFont = italicFont;
    self.textLabel.boldItalicFont = boldItalicFont;
    self.textLabel.boldTextColor = boldTextColor;
    self.textLabel.boldItalicTextColor = boldItalicTextColor;
    self.textLabel.italicTextColor = italicTextColor;
    self.textLabel.linkTextColor = [UIColor purpleColor];
    self.textLabel.html = [self html];

    [self.textLabel setLinkPressedBlock:^(NSTextCheckingResult *textCheckingResult) {
        NSLog(@"textCheckingResult => %@", textCheckingResult);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(74, 10, 10, 10));
    }];
    
    self.textLabel.heightChangeBlock = ^(UIView * label){
    
    };
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (NSString *) html
{
    return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"html"]
                                     encoding:NSUTF8StringEncoding
                                        error:nil];
}


@end
