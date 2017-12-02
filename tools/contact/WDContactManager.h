//
//  KDContactManager.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDContach.h"
#import "WDContactProtrocal.h"
#import "WDAddRessBookProtrocal.h"

@interface WDContactManager : NSObject
+ (instancetype)defaultManger;
@property (nonatomic,strong) Class<WDContactProtrocal> cls;
@property (nonatomic,weak,readonly) id<WDAddRessBookProtrocal> addRessBook;
@end
