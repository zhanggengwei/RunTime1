
//
//  KDContach.h
//  RunTime1
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#ifndef KDContach_h
#define KDContach_h
typedef enum : NSUInteger {
    WDAuthorizeStatusNotDetermined,
    WDAuthorizeStatusRestricted,
    WDAuthorizeStatusDenied,
    WDAuthorizeStatusAuthorized
} WDAuthorizeStatus;


typedef void(^requestAuthorizeBlock)(NSError * error,BOOL granted);
typedef void(^getContactsBlock)(NSArray * contacts);

#endif /* KDContach_h */
