
//
//  KDContactManager.m
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDContactManager.h"
#import "WDContactModel.h"
#import "KDContactAddressBook.h"
#import "WDAddressBook.h"
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 90000
//#define __IOS9_LATER__ (1)
//#else
//#define __IOS9_LATER__ (0)
//#endif

@interface WDContactManager()
@property (nonatomic,weak) NSObject<WDAddRessBookProtrocal> * addRessBook;
@end

@implementation WDContactManager

+ (instancetype)defaultManger
{
    static WDContactManager * manager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[WDContactManager alloc]_init];
    });
    return manager;
}
#pragma makr publicMethods
- (void)setCls:(Class<WDContactProtrocal>)cls
{
    if(cls)
    {
        _cls = cls;
        _addRessBook.cls = cls;
    }
}

- (id<WDAddRessBookProtrocal>)addRessBook
{
    return _addRessBook;
}

#pragma mark privatemethods
- (instancetype)_init
{
    if(self = [super init])
    {
        _cls = [WDContactModel class];
        
#if __IOS9_LATER__
        self.addRessBook = [KDContactAddressBook defaultManager];
#else
       self.addRessBook = [WDAddressBook defaultManager];
#endif
        [self setCls:[WDContactModel class]];
    }
    return self;
}



@end
