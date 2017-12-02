//
//  KDContactManager.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDContach.h"

@interface WDContactManager : NSObject

@property (nonatomic,assign,readonly)WDAuthorizeStatus status;
+ (instancetype)defaultManger;
- (void)requestAuthorizeWithFunction:(requestAuthorizeBlock)block;
//没有顺序的返回通讯录的信息
- (void)loadAllContacts:(getContactsBlock)block;
- (void)loadSortAllContacts:(getContactsBlock)block;
@end
