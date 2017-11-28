//
//  WDContactModel.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDContactProtrocal.h"
#import <AddressBook/AddressBook.h>


@interface WDContactModel : NSObject<WDContactProtrocal>

@property (nonatomic,strong,readonly) NSString * firstName;
@property (nonatomic,strong,readonly) NSString * lastName;
@property (nonatomic,strong,readonly) NSString * middleName;
@property (nonatomic,strong,readonly) NSArray * phones;
@property (nonatomic,copy) compareSelectore selector;
#if __IOS9_LATER__
- (instancetype)initWithObj:(id)obj;
#else
- (instancetype)initWithStructRecoard:(ABRecordRef)obj;
#endif

@end
