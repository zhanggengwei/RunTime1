//
//  KDContactManager.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
//#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 90000
//#define __IOS9_LATER__ (YES)
//#else
//#define __IOS9_LATER__ (YES)
//#endif





#import "WDContach.h"
#import "WDContactProtrocal.h"
#import "WDAddRessBookProtrocal.h"

@interface WDContactManager : NSObject
+ (instancetype)defaultManger;
@property (nonatomic,strong) Class<WDContactProtrocal> cls;
@property (nonatomic,weak,readonly) NSObject<WDAddRessBookProtrocal>* addRessBook;
@end
