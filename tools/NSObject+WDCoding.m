//
//  NSObject+WDCoding.m
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "NSObject+WDCoding.h"
#import "NSObject+WDExtensions.h"
#import "NSObject+WDClassProperty.h"
#import "WDProperty.h"
@implementation NSObject (WDCoding)
+ (NSArray *)WD_IgnoreKeyPropertys
{
    return nil;
}

+ (NSArray *)WD_EncodingKeyPropertys
{
    return nil;
}
- (void)WD_decode:(NSCoder *)decoder
{
    NSArray * array = [self needToEnCoderPropertys];
    [array enumerateObjectsUsingBlock:^(WDProperty  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"decoder ==%@",[decoder decodeObjectForKey:obj.name]);
       [self setValue:[decoder decodeObjectForKey:obj.name] forKey:obj.name];
    }];
}

- (void)WD_encode:(NSCoder *)encoder
{
    NSArray * array = [self needToEnCoderPropertys];
    [array enumerateObjectsUsingBlock:^(WDProperty  * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [encoder encodeObject:[self valueForKey:obj.name] forKey:obj.name];
    }];
}

- (NSArray *)needToEnCoderPropertys
{
    NSMutableArray * array = [[NSMutableArray alloc]initWithArray:[self.class propertys]];
    NSArray * ignoresArr = nil;
    if([self respondsToSelector:@selector(WD_IgnoreKeyPropertys)])
    {
        ignoresArr = [self performSelector:@selector(WD_IgnoreKeyPropertys)];
    }
    NSArray * encodeArr = nil;
    if([self respondsToSelector:@selector(WD_EncodingKeyPropertys)])
    {
        encodeArr = [self performSelector:@selector(WD_EncodingKeyPropertys)];
    }
    return array;
}
- (BOOL)saveTolocal:(NSString *)path
{
    WDLOG(@"path== %@",path);
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}

+ (id)loadFromLocal:(NSString *)path
{
    return  [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end
