//
//  NSObject+fmdb.h
//  RunTime
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (fmdb)

/*
   数据库打开
 */
+ (void)openDataBase:(NSString *)path error:(NSError **)error;

+ (NSArray *)searchFillter:(NSString *)fillter;

//数据插入或者修改
+ (instancetype)addOrUpdateModel:(id)model;

//数据删除

+ (BOOL)deleteModel:(id)model;

+ (BOOL)deleteModelWithFillter:(NSString *)fillter;


+ (NSArray *)primaryKey;

+ (NSArray *)saveToDBProperty;

+ (NSString *)tableName;

+ (void)merge_DB;






@end
