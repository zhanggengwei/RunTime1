//
//  NSObject+WDClassProperty.h
//  RunTime
//
//  Created by VD on 2017/11/22.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WDProperty;
@interface NSObject (WDClassProperty)
//@property (nonatomic,strong,readonly) NSArray<WDProperty *> * propertys;
+ (NSArray *)propertys;

+ (NSArray *)loadAllPropertys;

@end
