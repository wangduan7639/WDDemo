//
//  WDFMDBManager.h
//  WDDemo
//
//  Created by wd on 15/11/20.
//  Copyright © 2015年 wd. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface WDFMDBManager : NSObject

- (instancetype)instance;

//使用sql语句创建一个table
- (BOOL)createTable:(NSString *)sql;

//使用sql语句insert。
- (BOOL)insert:(NSString *)sql;

//使用obj语句insert
- (BOOL)insertObject:(NSObject *)obj;


- (BOOL)insert:(NSString *)table keyValues:(NSDictionary *)keyValues;

/**
 *  Insert @keyValues into @table
 *
 *  @param replace    if have is the same record, whether you need to replace
 */
- (BOOL)insert:(NSString *)table keyValues:(NSDictionary *)keyValues replace:(BOOL)replace;

/**
 *  Use @sql Update
 */
- (BOOL)update:(NSString *)sql;

/**
 *  Use @obj Update
 */
- (BOOL)updateObject:(NSObject *)obj;

/**
 *  Use @keyValues updated @table
 *
 *  @warning the default where is "id=?", so @keyValues must include "id"
 */
- (BOOL)update:(NSString *)table keyValues:(NSDictionary *)keyValues;

/**
 *  If the @where are met, use @keyValues updated @table
 */
- (BOOL)update:(NSString *)table keyValues:(NSDictionary *)keyValues where:(NSString *)where;

/**
 *  Delete from @table
 */
- (BOOL)remove:(NSString *)table;

/**
 *  Use @obj delete
 */
- (BOOL)removeObject:(NSObject *)obj;

/**
 *  Delete from @table where id=@id_
 */
- (BOOL)removeById:(NSString *)id_ from:(NSString *)table;

/**
 *  Delete from @table @where
 */
- (BOOL)remove:(NSString *)table where:(NSString *)where;

/**
 *  Select * from @table
 */
- (NSMutableArray *)query:(NSString *)table;

/**
 *  Select * from @table where id=@id_
 */
- (NSDictionary *)queryById:(NSString *)id_ from:(NSString *)table;

/**
 *  Select * from @table @where
 */
- (NSMutableArray *)query:(NSString *)table where:(NSString *)where, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Select count(id) from @table
 */
- (NSInteger)totalRowOfTable:(NSString *)table;

/**
 *  Select count(id) from @table @where
 */
- (NSInteger)totalRowOfTable:(NSString *)table where:(NSString *)where;

/**
 *  batch execute @sqls
 *
 *  @param useTransaction    whether to use transaction
 */
- (BOOL)executeBatch:(NSArray *)sqls useTransaction:(BOOL)useTransaction;
@end
