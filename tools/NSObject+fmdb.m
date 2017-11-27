//
//  NSObject+fmdb.m
//  RunTime
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "NSObject+fmdb.h"

//static BOOL opened;
@implementation NSObject (fmdb)

+ (void)openDataBase:(NSString *)path error:(NSError **)error
{
    
}

+ (instancetype)searchFillter:(NSString *)fillter
{
    return nil;
}
//数据插入或者修改
+ (instancetype)addOrUpdateModel:(id)model
{
    return nil;
}

+ (NSArray *)primaryKey
{
    return nil;
}

+ (NSArray *)saveToDBProperty
{
    return nil;
}
+ (NSString *)tableName
{
    return @"";
}

+ (BOOL)deleteModel:(id)model
{
    return YES;
}

+ (BOOL)deleteModelWithFillter:(NSString *)fillter
{
    return YES;
}

@end
