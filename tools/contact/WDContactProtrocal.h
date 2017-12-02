
//
//  WDContactProtrocal.h
//  RunTime1
//
//  Created by VD on 2017/11/28.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>
@protocol WDContactProtrocal;

typedef NSComparisonResult (^compareSelectore)(id<WDContactProtrocal> model1,id<WDContactProtrocal> model2);
@protocol WDContactProtrocal <NSObject>
@property (readonly, strong,nonatomic) NSString * namePrefix;
@property (readonly, strong,nonatomic) NSString * givenName;
@property (readonly, strong,nonatomic) NSString * middleName;
@property (readonly, strong,nonatomic) NSString * familyName;
@property (readonly, strong,nonatomic) NSString * nameSuffix;
@property (readonly, strong,nonatomic) NSString * nickname;

@property (readonly, strong,nonatomic) NSString * organizationName;
@property (readonly, strong,nonatomic) NSString * departmentName;
@property (readonly, strong,nonatomic) NSString * jobTitle;

@property (readonly, strong,nonatomic) NSString * phoneticGivenName;
@property (readonly, strong,nonatomic) NSString * phoneticMiddleName;
@property (readonly, strong,nonatomic) NSString * phoneticFamilyName;
@property (readonly, strong,nonatomic) NSString * phoneticOrganizationName;
@property (readonly, strong,nonatomic) NSString * note;

@property (readonly, strong,nonatomic) NSData * imageData;
@property (readonly, strong,nonatomic) NSData * thumbnailImageData;
@property (readonly, assign,nonatomic) BOOL imageDataAvailable;

@property (readonly, strong,nonatomic) NSArray * phoneNumbers;
@property (readonly, strong,nonatomic) NSArray *emailAddresses;
@property (readonly, strong,nonatomic) NSArray * postalAddresses;
@property (readonly, strong,nonatomic) NSArray * urlAddresses;

@property (readonly, strong,nonatomic) NSDateComponents *birthday;
@property (readonly, strong,nonatomic) NSDateComponents *nonGregorianBirthday;


#if __IOS9_LATER__
- (instancetype)initWithObj:(id)obj;
#else
- (instancetype)initWithStructRecoard:(ABRecordRef)obj;
#endif
@end
