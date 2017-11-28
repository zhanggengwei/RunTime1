//
//  WDProperty.h
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDPreHeader.h"
extern NSString *const WDPropertyTypeInt;
extern NSString *const WDPropertyTypeShort;
extern NSString *const WDPropertyTypeFloat;
extern NSString *const WDPropertyTypeDouble;
extern NSString *const WDPropertyTypeLong;
extern NSString *const WDPropertyTypeLongLong;
extern NSString *const WDPropertyTypeChar;
extern NSString *const WDPropertyTypeBOOL1;
extern NSString *const WDPropertyTypeBOOL2;
extern NSString *const WDPropertyTypePointer;

extern NSString *const WDPropertyTypeIvar;
extern NSString *const WDPropertyTypeMethod;
extern NSString *const WDPropertyTypeBlock;
extern NSString *const WDPropertyTypeClass;
extern NSString *const WDPropertyTypeSEL;
extern NSString *const WDPropertyTypeId;

@interface WDProperty : NSObject

@property (nonatomic,assign,readonly) objc_property_t property;
@property (nonatomic,copy,readonly) NSString * name;
@property (nonatomic,strong,readonly) Class  cls;
@property (nonatomic,strong,readonly) id value;
@property (nonatomic,assign,readonly) BOOL isMetaClass;
//基本数据类型的处理过程
- (id)loadPropertyValue:(id)model;

- (instancetype)initWithProperty:(objc_property_t)property;



@end
