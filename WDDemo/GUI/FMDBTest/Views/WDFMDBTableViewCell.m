//
//  WDFMDBTableViewCell.m
//  WDDemo
//
//  Created by wangduan on 15/11/22.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "WDFMDBTableViewCell.h"

@interface WDFMDBTableViewCell ()

@property (nonatomic, strong) UILabel   *idLabel;
@property (nonatomic, strong) UILabel   *nameLabel;
@property (nonatomic, strong) UILabel   *descLabel;

@end

@implementation WDFMDBTableViewCell

+ (CGFloat) heightWithItem: (RETableViewItem*) item tableViewManager: (RETableViewManager*) tableViewManager
{
    return 70;
}

- (void) cellDidLoad
{
    [super cellDidLoad];
    self.idLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.idLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.idLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.descLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.descLabel];
    
    [self.idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView).with.offset(5);
        make.height.mas_equalTo(20);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.idLabel.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.height.mas_equalTo(20);

    }];
}

- (void) cellWillAppear
{
    [super cellWillAppear];
}


@end
