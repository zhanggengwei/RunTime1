//
//  KDAddressBook.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDPreHeader.h"
#import "KDContach.h"
#import "WDContactProtrocal.h"

@interface KDAddressBook : NSObject

+ (instancetype)defaultManager;

@property (nonatomic,strong) Class<WDContactProtrocal> cls;

- (void)requestAuthorizeWithFunction:(requestAuthorizeBlock)block;

//没有顺序的返回通讯录的信息
- (void)loadAllContacts:(getContactsBlock)block;

- (void)loadSortAllContacts:(getContactsBlock)block;

@end



