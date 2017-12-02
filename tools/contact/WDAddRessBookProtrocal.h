//
//  WDAddRessBookProtrocal.h
//  RunTime1
//
//  Created by VD on 2017/12/2.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDContach.h"

@protocol WDAddRessBookProtrocal <NSObject>

+ (instancetype)defaultManager;
@property (nonatomic,strong) Class<WDContactProtrocal> cls;
@property (nonatomic,assign,readonly)WDAuthorizeStatus status;
- (void)requestAuthorizeWithFunction:(requestAuthorizeBlock)block;
//没有顺序的返回通讯录的信息
- (void)loadAllContacts:(getContactsBlock)block;
- (void)loadSortAllContacts:(getContactsBlock)block;
@end
