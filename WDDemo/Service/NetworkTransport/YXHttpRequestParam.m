//
//  YXHttpRequestParam.m
//  AFNetWorkingDemo
//
//  Created by wd on 15/10/19.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "YXHttpRequestParam.h"

@implementation YXHttpRequestParam
- (instancetype) init
{
    if (self = [super init]) {
        _params = [[NSMutableDictionary alloc] init];
        _headers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (instancetype) initWithHttpMethodType: (YXHttpMethodType) type fullUrl: (NSString*) fullUrl
{
    if (self = [self init]) {
        switch (type) {
            case YXHttpMethodTypeGet:
                self.httpMethod = @"GET";
                break;
                
            case YXHttpMethodTypePost:
                self.httpMethod = @"POST";
                break;
                
            case YXHttpMethodTypePut:
                self.httpMethod = @"PUT";
                break;
                
            default:
                self.httpMethod = @"GET";
                break;
        }
        self.url = fullUrl;
        
        _headers[@"Accept"] = @"application/json";
    }
    return self;
}

- (void) setParamValue: (id) value forKey: (NSString*) key
{
    if (value && key) {
        _params[key] = value;
    }
}

- (void) setParamsWithDictionay: (NSDictionary*) paramsDictionay
{
    [_params setValuesForKeysWithDictionary: paramsDictionay];
}

- (void) setRequestHeaderValue: (NSString*) value forKey: (NSString*) key
{
    if (value && key) {
        _headers[key] = value;
    }
}

- (void) setHeadersWithDictionay: (NSDictionary*) headersDictionary
{
    [_headers setValuesForKeysWithDictionary: headersDictionary];
}
- (NSString*) formatGetMethodParam
{
    NSString* format = @"";
    NSEnumerator* enumeratorKey = [_params keyEnumerator];
    
    for (NSString* key in enumeratorKey) {
        format = [format stringByAppendingFormat: format.length == 0 ? @"%@=%@" : @"&%@=%@", key, _params[key]];
    }
    
    return format;
}

- (NSString*) getMethodUrl
{
    NSCharacterSet * Cset = [NSCharacterSet URLQueryAllowedCharacterSet];
    if (_params.count > 0) {
        /**
         *  url路径中是不能有个"?"字符的
         *  如果url中已有"?"字符，则认为url中已有部分参数
         */
        if ([self.url rangeOfString: @"?"].location != NSNotFound) {
            return [[self.url stringByAppendingFormat: @"&%@", [self formatGetMethodParam]] stringByAddingPercentEncodingWithAllowedCharacters: Cset];
        } else {
            return [[self.url stringByAppendingFormat: @"?%@", [self formatGetMethodParam]] stringByAddingPercentEncodingWithAllowedCharacters: Cset];
        }
    } else {
        return [self.url stringByAddingPercentEncodingWithAllowedCharacters: Cset];
    }
}
@end
@implementation NSString (YXUrlPathExtensions)

- (NSString*) YXStringByAppendingUrlComponent: (NSString*) str
{
    NSCharacterSet* slashCharacterSet = [NSCharacterSet characterSetWithCharactersInString: @"/"];
    NSString* urlPath = [self stringByTrimmingCharactersInSet: slashCharacterSet];
    NSString* component = [str stringByTrimmingCharactersInSet: slashCharacterSet];
    
    return [NSString stringWithFormat: @"%@/%@", urlPath, component];
}

@end
