
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
@property (nonatomic,copy) compareSelectore selector;
#if __IOS9_LATER__
- (instancetype)initWithObj:(id)obj;
#else
- (instancetype)initWithStructRecoard:(ABRecordRef)obj;
#endif
@end
