//
//  WDProperty.m
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDProperty.h"
#import "WDPreHeader.h"

NSString *const WDPropertyTypeInt = @"i";
NSString *const WDPropertyTypeShort = @"s";
NSString *const WDPropertyTypeFloat = @"f";
NSString *const WDPropertyTypeDouble = @"d";
NSString *const WDPropertyTypeLong = @"l";
NSString *const WDPropertyTypeLongLong = @"q";
NSString *const WDPropertyTypeChar = @"c";
NSString *const WDPropertyTypeBOOL1 = @"c";
NSString *const WDPropertyTypeBOOL2 = @"b";
NSString *const WDPropertyTypePointer = @"*";

NSString *const WDPropertyTypeIvar = @"^{objc_ivar=}";
NSString *const WDPropertyTypeMethod = @"^{objc_method=}";
NSString *const WDPropertyTypeBlock = @"@?";
NSString *const WDPropertyTypeClass = @"#";
NSString *const WDPropertyTypeSEL = @":";
NSString *const WDPropertyTypeId = @"@";

@implementation WDProperty
@synthesize cls = _cls;
@synthesize value = _value;
- (void)setProperty:(objc_property_t)property
{
    if(property==nil)
    {
        WDLOG(@"property == nil");
        return;
    }
    if(_property==nil)
    {
        _property = property;
        _name = STR(property_getName(property));
        NSString * attribute = STR(property_getAttributes(_property));
        _cls = [self getModelClassWithModelAttribute:attribute];
        NSLog(@"class ==%@",_cls);
    }
}

- (void)setCls:(Class)cls
{
    _cls = cls;
}

- (Class)getModelClassWithModelAttribute:(NSString *)attribute
{
    attribute = [attribute componentsSeparatedByString:@","].firstObject;
    char ch = [attribute characterAtIndex:1];
    if(ch=='@')
    {
        NSString * class = [[attribute substringFromIndex:2]stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        return NSClassFromString(class);
    }
    return nil;
}


- (Class)cls
{
    return _cls;
}
//NSOBject NSNumer NSString NSDate NSDict
- (BOOL)isMetaClass
{
    if(_cls==nil)
    {
        return YES;
    }
    NSArray * classArray = @[@"NSObject",@"NSNumber",@"NSDate",@"NSDictionary",@"NSString",@"NSMutableString",@"NSArray"];
    if([classArray containsObject:NSStringFromClass(_cls)])
    {
        return YES;
    }
    return NO;
}

- (id)value
{
    return _value?_value:[NSNull null];
}
- (void)setValue:(id)value
{
    _value = value;
}

- (id)loadPropertyValue:(id)model
{
    if (self.cls==nil) {
        //基本数据类型
        _value = [model valueForKey:self.name];
        return _value;
    }
    _value = [model valueForKey:self.name];
    return _value;
}
- (instancetype)initWithProperty:(objc_property_t)property
{
    if(self = [super init])
    {
        self.property = property;
    }
    return self;
}


@end
