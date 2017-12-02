

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
#if __IOS9_LATER__
    CNContact * _obj;
#else
    ABRecordRef _obj;
#endif
}
#if __IOS9_LATER__
- (instancetype)initWithObj:(CNContact *)obj
{
    if(self = [super init])
    {
        _obj = obj;
        [self _loadData];
    }
    return self;
}
- (void)_loadData
{
    _givenName = _obj.givenName;
    _namePrefix = _obj.namePrefix;
    _middleName = _obj.middleName;
    _familyName = _obj.familyName;
    _nameSuffix = _obj.nameSuffix;
    _nickname = _obj.nickname;
    
    _organizationName = _obj.organizationName;
    _departmentName = _obj.departmentName;
    _jobTitle = _obj.jobTitle;
    
    _phoneticGivenName = _obj.phoneticGivenName;
    _phoneticMiddleName = _obj.phoneticMiddleName;
    _phoneticFamilyName = _obj.phoneticFamilyName;
    _note = _obj.note;
    _imageData = _obj.imageData;
    _thumbnailImageData = _obj.thumbnailImageData;
    _imageDataAvailable = _obj.imageDataAvailable;
    _phoneNumbers = _obj.phoneNumbers;
    _emailAddresses = _obj.emailAddresses;
    _postalAddresses = _obj.postalAddresses;
    _urlAddresses = _obj.emailAddresses;
    _birthday = _obj.birthday;
    _nonGregorianBirthday = _obj.nonGregorianBirthday;
    
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
