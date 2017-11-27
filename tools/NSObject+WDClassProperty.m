
//
//  NSObject+WDClassProperty.m
//  RunTime
//
//  Created by VD on 2017/11/22.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "NSObject+WDClassProperty.h"
#import "WDProperty.h"
static NSMutableDictionary * classPropertyDict;
@implementation NSObject (WDClassProperty)

+ (void)load
{
    if(classPropertyDict==nil)
    {
        classPropertyDict = [NSMutableDictionary new];
    }
}

+ (NSArray *)propertys
{
    NSString * className = NSStringFromClass(self.class);
    NSMutableArray * array = [classPropertyDict objectForKey:className];
    if(array)
    {
        return array;
    }
    array = [NSMutableArray new];
    unsigned int count;
    objc_property_t * list  = class_copyPropertyList(self.class,&count);
    for (int i = 0; i < count; i++) {
        WDProperty * property = [WDProperty new];
//        property.property = list[i];
        [property loadPropertyValue:self];
        [array addObject:property];
    }
    if(array.count)
    {
        [classPropertyDict setObject:array forKey:className];
    }
    return  array;
}
+ (NSArray *)loadAllPropertys
{
    NSMutableArray * array = [NSMutableArray new];
    Class cls = self.class;
    while (cls!=[NSObject class]) {
        [array addObjectsFromArray:[cls propertys]];
        cls = [cls superclass];
    }
    WDLOG(@"array ==%@",array);
    
    return array;
}
@end
