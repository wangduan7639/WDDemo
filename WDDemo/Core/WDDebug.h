//
//  WDDebug.h
//  WDDemo
//
//  Created by wd on 15/11/16.
//  Copyright © 2015年 wd. All rights reserved.
//

#ifndef WDDebug_h
#define WDDebug_h

#ifdef DEBUG
#   define WDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define WDLog(...)
#endif

#endif /* WDDebug_h */
