//
//  WDHttpRequestParam.h
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDNetworkDefine.h"

@interface WDHttpRequestParam : NSObject
@property (strong, nonatomic) NSString* httpMethod;
@property (strong, nonatomic) NSString* url;
@property (readonly, nonatomic) NSMutableDictionary* params;
@property (readonly, nonatomic) NSMutableDictionary* headers;
@property (strong, nonatomic) NSString* tag;

- (instancetype) initWithHttpMethodType: (WDHttpMethodType) type fullUrl: (NSString*) fullUrl;
- (void) setParamValue: (id) value forKey: (NSString*) key;
- (void) setRequestHeaderValue: (NSString*) value forKey: (NSString*) key;

- (void) setParamsWithDictionay: (NSDictionary*) paramsDictionay;
- (void) setHeadersWithDictionay: (NSDictionary*) headersDictionary;

//用于调试
- (NSString*) formatGetMethodParam;
- (NSString*) getMethodUrl;

@end

@interface NSString (WDUrlPathExtensions)

- (NSString*) WDStringByAppendingUrlComponent: (NSString*) str;

@end
