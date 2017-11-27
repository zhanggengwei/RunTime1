
//
//  KDAddressBook.m
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "KDAddressBook.h"
#import <AddressBook/AddressBook.h>
#import "WDPreHeader.h"


@implementation KDAddressBook
{
    ABAddressBookRef _bookRef;
}

+ (instancetype)defaultManager
{
    static KDAddressBook * addressBook;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        addressBook  = [KDAddressBook new];
    });
    return addressBook;
}

- (instancetype)init
{
    if(self = [super init])
    {
        _bookRef = ABAddressBookCreate();
    }
    return self;
}
- (void)loadAllContacts:(getContactsBlock)block
{
    NSArray * arr = CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(_bookRef));
    NSLog(@"%@",arr);
    
    
}
@end
