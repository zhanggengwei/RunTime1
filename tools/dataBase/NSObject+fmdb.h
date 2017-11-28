//
//  NSObject+fmdb.h
//  RunTime
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (fmdb)

+ (NSArray *)primaryKey;

+ (NSArray *)saveToDBProperty;

+ (NSString *)tableName;


@end
