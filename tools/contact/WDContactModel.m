

//
//  WDContactModel.m
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDContactModel.h"

@implementation WDContactModel
{
#if __IOS9_LATER__
    id _obj;
#else
    ABRecordRef _obj;
#endif
    NSString * _firstName;
    NSString * _lastName;
    NSString * _middleName;
    NSArray *  _phones;
    
}
#if __IOS9_LATER__
- (instancetype)initWithObj:(id)obj
{
    if(self = [super init])
    {
        _obj = obj;
    }
    return self;
}
#else
- (instancetype)initWithStructRecoard:(ABRecordRef)model
{
    if(self = [super init])
    {
        _obj = model;
        [self _loadData];
    }
    return self;
}
- (void)_loadData
{
    _firstName = (__bridge NSString *)ABRecordCopyValue(_obj,kABPersonFirstNameProperty);
    _middleName = (__bridge NSString *)ABRecordCopyValue(_obj,kABPersonMiddleNameProperty);
    _lastName = (__bridge NSString *)ABRecordCopyValue(_obj,kABPersonLastNameProperty);
    _phones = (__bridge NSArray *)ABRecordCopyValue(_obj, kABPersonPhoneProperty);
}
#endif
@end
