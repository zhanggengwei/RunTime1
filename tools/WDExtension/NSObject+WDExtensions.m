//
//  NSObject+WDExtensions.m
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "NSObject+WDExtensions.h"
#import "WDProperty.h"
#import "WDUserInfo.h"
#import "NSObject+WDClassProperty.h"

@implementation NSObject (WDExtensions)

+ (void)load
{
    Method method1 = class_getInstanceMethod([self class], @selector(description));
    Method method2 = class_getInstanceMethod([self class], @selector(print_model));
    method_exchangeImplementations(method1, method2);
    WDLOG(@"交换两个方法的具体的实现");
}

+ (instancetype)WD_object:(NSDictionary *)dict error:(NSError **)error;
{
    id object = [self.class new];
    NSArray<WDProperty *> * list  = [self getPropertyListWithModelClass:[self new]];
    for (WDProperty * model in list) {
        id value = nil;
        if(!model.isMetaClass)
        {
            value = [model.cls WD_object:[dict objectForKey:model.name] error:error];
        }else
        {
            value = [dict objectForKey:model.name];
        }
        [object setValue:value forKey:model.name];
    }
    return object;
}
+ (instancetype)WD_objectModels:(NSDictionary *)dict error:(NSError * __autoreleasing *)error
{
    __block NSMutableArray * array = [NSMutableArray new];
    [[dict allValues]enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[self.class WD_object:obj error:error]];
    }];
    return array;
}

+ (NSArray<WDProperty *> *)getPropertyListWithModelClass:(id)model
{
    if([model class]==[NSObject class]||[model class]==[NSNull class])
    {
        return nil;
    }
    WDLOG(@"class == %@",[model class]);
    NSMutableArray * array = [NSMutableArray new];
    unsigned int count = 0;
    objc_property_t * list =  class_copyPropertyList([model class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t p = list[i];
        WDProperty * property = [[WDProperty alloc]initWithProperty:p];
        [property loadPropertyValue:model];
        [array addObject:property];
    }
    free(list);
    return array;
}

- (NSDictionary *)modelTransFromDict
{
    Class cls = self.class;
    if(cls == [NSObject class]||cls==[NSString class]||cls == [NSNumber class]||cls==[NSData class]||cls==[NSDictionary class])
    {
        return  @{};
    }
    NSMutableDictionary * dict = [NSMutableDictionary new];
    NSArray<WDProperty *> * propertys = [self.class getPropertyListWithModelClass:self];
    for (WDProperty * model in propertys) {
        if(!model.isMetaClass)
        {
            id value = model.value?model.value:[model.cls new];
            [dict setObject:[value modelTransFromDict] forKey:model.name];
            
        }else{
           [dict setObject:model.value forKey:model.name];
        }
    }
    return dict;
}

+ (NSArray *)WD_allowPropertys
{
    return nil;
}
+ (NSArray *)WD_ignorePropertys
{
    return nil;
}
+ (NSDictionary *)replacePropertyKeys
{
    return nil;
}
+ (NSDictionary<NSString *,Class> *)WDArray_Models
{
    return @{};
}

- (NSString *)print_model
{
    return [self modelTransFromDict].description;
}
+ (NSArray<WDProperty *> *)_propertys
{
    NSArray * _defaultPros = [self.class propertys];
    NSArray * _allowPros = [self.class WD_allowPropertys];
    NSArray * _ignorePros = [self.class WD_ignorePropertys];
    
    
    
    if(_ignorePros==nil&&_allowPros==nil)
    {
        return [self.class propertys];
    }
    else if(_ignorePros==nil&&_allowPros!=nil)
    {
        return _allowPros;
    }
    else if(_ignorePros!=nil&&_allowPros==nil)
    {
        return nil;
    }else
    {
//    assert(_ignorePros.count+_allowPros.count>_defaultPros.count,"WD_allowPropertys WD_ignorePropertys leat is not valied");
    }
    return nil;
    
}



@end
