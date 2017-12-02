
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

@implementation WDContactManager
{
    id<WDAddRessBookProtrocal> _addRessBook;
}
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
        _addRessBook = [KDContactAddressBook defaultManager];
    }
    return self;
}



@end
