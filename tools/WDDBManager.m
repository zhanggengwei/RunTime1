

//
//  WDDBManager.m
//  RunTime
//
//  Created by VD on 2017/11/27.
//  Copyright © 2017年 VD. All rights reserved.
//

#import "WDDBManager.h"
#import <FMDB.h>
#import "WDPreHeader.h"
#import <assert.h>
#import<CommonCrypto/CommonDigest.h>


@implementation WDDBManager
{
    FMDatabaseQueue * _dbQueue;
}
+ (instancetype)defaultManager
{
    static WDDBManager * manager;
    static dispatch_once_t token;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [WDDBManager new];
    });
    return manager;
}

- (void)setDbPath:(NSString *)dbPath
{
    _dbPath = dbPath;
    [self ifNeedCreateFile];
}


- (void)ifNeedCreateFile
{
    if(_dbPath==nil)
    {
        WDLOG(@"_dbPath %@ is not valid ",_dbPath);
        return ;
    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL dir;
    BOOL exists = [fileManager fileExistsAtPath:_dbPath isDirectory:&dir];
    if (!exists)
    {
        WDLOG(@"create file %@",_dbPath);
        [fileManager createFileAtPath:_dbPath contents:nil attributes:nil];
        return;
    }
    //不成立 执行后面的语句
    NSString * debug = [NSString stringWithFormat:@"%@ is dir",_dbPath];
    WDAssert(!dir,debug);
    
}

- (void)addOrUpdateModel:(id)model
{
    
}

- (void)deleteModel:(id)model
{
    
}

- (void)deleteModelWithFillter:(NSString *)fillter
{
    
}
@end
