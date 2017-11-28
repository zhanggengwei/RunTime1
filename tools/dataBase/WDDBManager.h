//
//  WDDBManager.h
//  RunTime
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDDBManager : NSObject

+ (instancetype)defaultManager;
//default version = 1.0
@property (nonatomic,strong) NSString * version;

@property (nonatomic,strong) NSString * dbPath;

- (void)addOrUpdateModel:(id)model;

- (void)deleteModel:(id)model;

- (void)deleteModelWithFillter:(NSString *)fillter;





@end
