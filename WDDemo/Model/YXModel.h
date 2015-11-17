//
//  YXModel.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface YXModel : JSONModel
@property(nonatomic, strong)id<Optional>  status;
@property(nonatomic, strong)id<Optional>  data;
@property(nonatomic, strong)id<Optional>  property;
@property(nonatomic, strong)id<Optional> errorDict;
@end
