//
//  NSObject+WDExtensions.h
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDPreHeader.h"

@class WDProperty;

@interface NSObject (WDExtensions)

+ (instancetype)WD_object:(NSDictionary *)dict error:(NSError **)error;

+ (instancetype)WD_objectModels:(NSDictionary *)dict error:(NSError **)error;

- (NSDictionary *)modelTransFromDict;

+ (NSDictionary<NSString *,Class> *)WDArray_Models;


+ (NSArray<WDProperty *> *)getPropertyListWithModelClass:(id)model;


+ (NSArray *)WD_allowPropertys;

+ (NSArray *)WD_ignorePropertys;

+ (NSDictionary *)replacePropertyKeys;


@end
