

//
//  WDContactModel.m
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDContactModel.h"
#import <Contacts/Contacts.h>

@interface WDContactModel()
@property (strong,nonatomic) NSString * namePrefix;
@property (strong,nonatomic) NSString * givenName;
@property (strong,nonatomic) NSString * middleName;
@property (strong,nonatomic) NSString * familyName;

@property (strong,nonatomic) NSString * nameSuffix;
@property (strong,nonatomic) NSString * nickname;

@property (strong,nonatomic) NSString * organizationName;
@property (strong,nonatomic) NSString * departmentName;
@property (strong,nonatomic) NSString * jobTitle;

@property (strong,nonatomic) NSString * phoneticGivenName;
@property (strong,nonatomic) NSString * phoneticMiddleName;
@property (strong,nonatomic) NSString * phoneticFamilyName;
@property (strong,nonatomic) NSString * phoneticOrganizationName;
@property (strong,nonatomic) NSString * note;

@property (strong,nonatomic) NSData * imageData;
@property (strong,nonatomic) NSData * thumbnailImageData;
@property (assign,nonatomic) BOOL imageDataAvailable;

@property (strong,nonatomic) NSArray * phoneNumbers;
@property (strong,nonatomic) NSArray *emailAddresses;
@property (strong,nonatomic) NSArray * postalAddresses;
@property (strong,nonatomic) NSArray * urlAddresses;

@property (strong,nonatomic) NSDateComponents *birthday;
@property ( strong,nonatomic) NSDateComponents *nonGregorianBirthday;

@end

@implementation WDContactModel
{
    void * _obj;
}
- (instancetype)initWithObj:(void *)obj
{
    if(self = [super init])
    {
        _obj = obj;
        #if __IOS9_LATER__
        CNContact * contact = (__bridge CNContact *)(obj);
        [self _loadData:contact];
        #else
        ABRecordRef recoard = obj;
        [self _loadData:recoard];
        #endif
    }
    return self;
}
#if __IOS9_LATER__
- (void)_loadData:(CNContact *)contact
{
    _givenName = contact.givenName;
    _namePrefix = contact.namePrefix;
    _middleName = contact.middleName;
    _familyName = contact.familyName;
    _nameSuffix = contact.nameSuffix;
    _nickname = contact.nickname;
    
    _organizationName = contact.organizationName;
    _departmentName = contact.departmentName;
    _jobTitle = contact.jobTitle;
    
    _phoneticGivenName = contact.phoneticGivenName;
    _phoneticMiddleName = contact.phoneticMiddleName;
    _phoneticFamilyName = contact.phoneticFamilyName;
    _note = contact.note;
    _imageData = contact.imageData;
    _thumbnailImageData = contact.thumbnailImageData;
    _imageDataAvailable = contact.imageDataAvailable;
    _phoneNumbers = contact.phoneNumbers;
    _emailAddresses = contact.emailAddresses;
    _postalAddresses = contact.postalAddresses;
    _urlAddresses = contact.emailAddresses;
    _birthday = contact.birthday;
    _nonGregorianBirthday = contact.nonGregorianBirthday;
    
}
#else
- (void)_loadData:(ABRecordRef)recoard
{
    _givenName = [self _loadProperty:kABPersonFirstNameProperty];
    _namePrefix = [self _loadProperty:kABPersonPrefixProperty];
    _middleName = [self _loadProperty:kABPersonMiddleNameProperty];
    _familyName = [self _loadProperty:kABPersonFirstNameProperty];
    _nameSuffix = [self _loadProperty:kABPersonSuffixProperty];
    _nickname = [self _loadProperty:kABPersonNicknameProperty];
    
    _organizationName = [self _loadProperty:kABPersonOrganizationProperty];
    _departmentName = [self _loadProperty:kABPersonDepartmentProperty];
    _jobTitle = [self _loadProperty:kABPersonDepartmentProperty];
    
    _phoneticGivenName = [self _loadProperty:kABPersonFirstNamePhoneticProperty];
    _phoneticMiddleName = [self _loadProperty:kABPersonMiddleNamePhoneticProperty];
    _phoneticFamilyName = [self _loadProperty:kABPersonLastNamePhoneticProperty];
    _note = [self _loadProperty:kABPersonNoteProperty];
    _imageData = (__bridge NSData *)(ABPersonCopyImageData(_obj));
    _thumbnailImageData = (__bridge NSData *)(ABPersonCopyImageDataWithFormat(_obj,kABPersonImageFormatThumbnail));
    _imageDataAvailable = ABPersonHasImageData(_obj);
    _phoneNumbers = [self _loadArrayWithProperty:kABPersonPhoneProperty];
    _emailAddresses = [self _loadArrayWithProperty:kABPersonEmailProperty];
    _postalAddresses = [self _loadArrayWithProperty:kABPersonAddressProperty];
    _urlAddresses = [self _loadArrayWithProperty:kABPersonURLProperty];
    _birthday = [self _loadDateProperty:kABPersonBirthdayProperty];
    _nonGregorianBirthday = [self _loadDateProperty:kABPersonAlternateBirthdayProperty];
}
- (NSArray *)_loadArrayWithProperty:(ABPropertyID)property
{
    NSMutableArray * array = [NSMutableArray new];
    ABMultiValueRef multiValue = ABRecordCopyValue(_obj, property);
    for (int i = 0; i<ABMultiValueGetCount(multiValue); i++) {
        NSString * model = CFBridgingRelease(ABMultiValueCopyValueAtIndex(multiValue, i));
        [array addObject:model];
    }
    NSLog(@"array==%@",array);
    return array;
}

- (NSString *)_loadProperty:(ABPropertyID)property
{
    return (__bridge NSString *)ABRecordCopyValue(_obj,property);
}

- (NSDateComponents *)_loadDateProperty:(ABPropertyID)property
{
    return (__bridge NSDateComponents *)ABRecordCopyValue(_obj,property);
}

#endif
@end
