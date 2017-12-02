
//
//  KDContactManager.m
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDContactManager.h"
#import <Contacts/Contacts.h>
#import <Contacts/CNContact.h>
@implementation WDContactManager
{
    CNContactStore * _contactStore;
    CNContactFetchRequest * _fetchRequest;
    WDAuthorizeStatus _status;
}
+ (instancetype)defaultManger
{
    static WDContactManager * manager;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [WDContactManager new];
    });
    return manager;
}

- (instancetype)init
{
    if(self = [super init])
    {
        if (@available(iOS 9.0, *)) {
            if (@available(iOS 10.0, *)) {
                NSArray * fetchArray = @[CNContactNamePrefixKey,CNContactGivenNameKey,CNContactMiddleNameKey,CNContactFamilyNameKey,CNContactPreviousFamilyNameKey,CNContactNameSuffixKey,CNContactNicknameKey,CNContactOrganizationNameKey,CNContactDepartmentNameKey,CNContactJobTitleKey,CNContactPhoneticGivenNameKey,CNContactPhoneticMiddleNameKey           ,CNContactPhoneticFamilyNameKey,CNContactPhoneticOrganizationNameKey,CNContactBirthdayKey,CNContactNonGregorianBirthdayKey            ,CNContactNoteKey,CNContactImageDataKey,CNContactThumbnailImageDataKey, CNContactImageDataAvailableKey, CNContactTypeKey, CNContactPhoneNumbersKey,CNContactEmailAddressesKey,CNContactPostalAddressesKey,CNContactDatesKey,CNContactUrlAddressesKey,CNContactRelationsKey ,CNContactSocialProfilesKey,CNContactInstantMessageAddressesKey ];
                _contactStore = [CNContactStore new];
                _fetchRequest = [[CNContactFetchRequest alloc]initWithKeysToFetch:fetchArray];
                _fetchRequest = [[CNContactFetchRequest alloc]initWithKeysToFetch:fetchArray];
            } else {
                // Fallback on earlier versions
            }
            
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    return self;
}
//没有顺序的返回通讯录的信息
- (void)loadAllContacts:(getContactsBlock)block
{
    NSMutableArray * array = [NSMutableArray new];
    NSError * error = nil;
    [_contactStore enumerateContactsWithFetchRequest:_fetchRequest error:&error usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        [array addObject:contact];
    }];
    NSLog(@"arra==%@",array);
}

- (void)loadSortAllContacts:(getContactsBlock)block
{
    
}
- (void)requestAuthorizeWithFunction:(requestAuthorizeBlock)block
{
    [_contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(block)
        {
            block(error,granted);
        }
    }];
}

- (WDAuthorizeStatus)status
{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    switch (status) {
        case CNAuthorizationStatusNotDetermined:
            _status = WDAuthorizeStatusNotDetermined;
            break;
        case CNAuthorizationStatusRestricted:
            _status = WDAuthorizeStatusRestricted;
            break;
        case CNAuthorizationStatusDenied:
            _status = WDAuthorizeStatusDenied;
            break;
        case CNAuthorizationStatusAuthorized:
            _status = WDAuthorizeStatusAuthorized;
            break;
        default:
            break;
    }
    return _status;
}
@end
