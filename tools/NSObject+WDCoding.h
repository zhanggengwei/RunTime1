//
//  NSObject+WDCoding.h
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDPreHeader.h"



@protocol WDCodingDelegate

+ (NSArray *)WD_IgnoreKeyPropertys;

+ (NSArray *)WD_EncodingKeyPropertys;


@end

@interface NSObject (WDCoding)

/**
 *  解码（从文件中解析对象）
 */
- (void)WD_decode:(NSCoder *)decoder;
/**
 *  编码（将对象写入文件中）
 */
- (void)WD_encode:(NSCoder *)encoder;


- (BOOL)saveTolocal:(NSString *)path;

+ (id)loadFromLocal:(NSString *)path;


@end

#define WDCodingImplementation \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self WD_decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self WD_encode:encoder]; \
}

#define WDExtensionImplementation WDCodingImplementation

