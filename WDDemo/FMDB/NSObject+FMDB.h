//
//  NSObject+FMDB.h
//  WDDemo
//
//  Created by wangduan on 15/11/21.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FMDB)


@property (nonatomic, readonly) NSMutableDictionary *keyValues;

/**
 *  The key is the best as the property name，if not. @see mapping
 */
- (instancetype)initWithDictionary:(NSDictionary *)keyValues;

/**
 *  If the property type is a custom class, you need to overwrite this method.
 *
 *  @return key is property name, value is model class, default return @{};
 */
- (NSDictionary *)objectPropertys;

/**
 *  If the property name and the JSON keys is not the same key, you need to overwrite this method.
 *
 *  @return key is datasource's key, value is property name, default return @{}.
 */
- (NSDictionary *)mapping;

/**
 *  If the model class name and the table name is different, you need to overwrite this method.
 *
 *  @return default return the class name.
 */
+ (NSString *)tableName;

@end
