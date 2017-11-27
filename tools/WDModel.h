//
//  WDModel.h
//  RunTime
//
//  Created by VD on 2017/11/20.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDProperty.h"
#import "WDUserInfo.h"

@interface WDModel : NSObject<NSCoding>
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * value;
@property (nonatomic,strong) NSNumber * number;
@property (nonatomic,strong) NSDate * date;
//@property (nonatomic,strong) NSArray * array;
@property (nonatomic,assign) NSInteger  tag;
@property (nonatomic,assign) double  tag1;
@property (nonatomic,assign) NSUInteger  tag2;
@property (nonatomic,assign) long  tag3;
@property (nonatomic,assign) long long  tag4;
@property (nonatomic,assign) float  tag5;
//@property (nonatomic,assign) char * tag6;
//@property (nonatomic,strong) WDProperty * property;
@property (nonatomic,strong) WDUserInfo * info;
@end
