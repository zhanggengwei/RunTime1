//
//  WDPreHeader.h
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#ifndef WDPreHeader_h
#define WDPreHeader_h
#import <UIKit/UIKit.h>

#import <objc/message.h>
#import <objc/runtime.h>

#ifdef DEBUG
#define WDLOG(...)  NSLog(__VA_ARGS__)
#define WDAssert(...) NSAssert(__VA_ARGS__)
#else
define WDLOG(...)
#define WDAssert(...)
#endif

#ifndef STR
#define STR(s) [NSString stringWithFormat:@"%s",s]
#endif

#define iOS9_LATER  ([[UIDevice currentDevice].systemVersion floatValue] >=9.0)


#endif /* WDPreHeader_h */
