//
//  WDUser.h
//  RunTime
//
//  Created by VD on 2017/11/22.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDModel.h"
#import "NSObject+WDCoding.h"
@interface WDUser : NSObject<NSCoding>

@property (nonatomic,strong) NSString * wd_user;
@property (nonatomic,assign) int age;
@property (nonatomic,strong) NSArray<WDModel *> * results;
@property (nonatomic,strong) WDModel * model;
@end
