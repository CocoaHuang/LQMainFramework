//
//  LQCacheManager.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/13.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQCacheManager.h"

NSString * const kCachesDirectoryName = @"MYCachesDirectory";         //缓存文件夹
NSString * const kCachesDataKey = @"CachesDataKey";                   //数据字典的 data key
NSString * const kCachesSaveTime = @"CachesSaveTime";                 //数据字典的 缓存时间
NSString * const kCachesFailTime = @"MYCachesDirectory";              //数据字典的 过期时间 0:不会过期

static LQCacheManager *CachesManager = nil;

@implementation LQCacheManager

MJExtensionCodingImplementation

#pragma mark set up
+ (instancetype)shareMYCachesManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CachesManager = [[LQCacheManager alloc] init];
        [CachesManager setupForCachesManager];
    });
    return CachesManager;
}

- (void)setupForCachesManager
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePaht = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    _cacheDirectoryPath = [cachePaht stringByAppendingPathComponent:kCachesDirectoryName];
    BOOL isDir = false;
    BOOL isDirExist = [fileManager fileExistsAtPath:_cacheDirectoryPath isDirectory:&isDir];
    
    if (isDirExist && isDir)
    {
        //文件夹存在
        return;
    }
    else
    {
        //创建文件夹
        [fileManager createDirectoryAtPath:_cacheDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

#pragma mark 当前的缓存文件路径
+ (NSString *)getCacheFilePath:(NSString *)fileStr
{
    //md5 加密 url 作为文件名
    NSString *fileName = [NSObject encryptionBaseOnMD5:fileStr];
    NSString *filePath = [[LQCacheManager shareMYCachesManager].cacheDirectoryPath stringByAppendingPathComponent:fileName];
    return filePath;
}


#pragma mark 存储缓存
+ (BOOL)saveDataWithData:(id)saveData fileName:(NSString *)fileName invalidTimeLength:(NSString *)invalidTimeLength
{
    if (!saveData || !fileName || !invalidTimeLength) {
        return NO;
    }
    NSMutableDictionary *saveMuDict = [NSMutableDictionary dictionary];
    [saveMuDict setValue:saveData forKey:kCachesDataKey];
    [saveMuDict setValue:[LQCacheManager getCurrentTimeStr] forKey:kCachesSaveTime];
    [saveMuDict setValue:invalidTimeLength forKey:kCachesFailTime];
    [NSKeyedArchiver archiveRootObject:saveMuDict toFile:[LQCacheManager getCacheFilePath:fileName]];
    return YES;
}

#pragma mark 读取缓存数据
+ (NSDictionary *)readMYCacheData:(NSString *)fileName
{
    NSString *filePath = [LQCacheManager getCacheFilePath:fileName];
    if ([LQCacheManager isCanUseCacheWithFileName:filePath])
    {
        //有缓存
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        if (dict)
        {
            NSDictionary *myCacheData = [dict valueForKey:kCachesDataKey];
            NSString *mySaveTime = [dict valueForKey:kCachesSaveTime];
            NSString *myFailTime = [dict valueForKey:kCachesFailTime];
            if ([myFailTime isEqualToString:@"0"])
            {
                //不过期缓存
                return myCacheData;
            }
            else
            {
                //过期缓存
                NSString *currentTime = [LQCacheManager getCurrentTimeStr];
                if ([currentTime doubleValue] > ([mySaveTime doubleValue] + [myFailTime doubleValue]))
                {
                    //过期
                    return nil;
                }
                else
                {
                    return myCacheData;
                }
            }
        }
        else
        {
            return nil;
        }
    }
    else {
        return nil;
    }
}


//缓存是可用
+ (BOOL)isCanUseCacheWithFileName:(NSString *)filePath
{
    //缓存路径
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        return YES;
    }
    else {
        //无缓存
        return NO;
    }
}


//获取当前时间的字符串
+ (NSString *)getCurrentTimeStr
{
    NSString *currentTime = [NSString stringWithFormat:@"%lf",[NSDate date].timeIntervalSince1970];
    return currentTime;
}

//+ (BOOL)saveDataWithPlistFile:(id)saveData
//{
//
////    [NSUserDefaults standardUserDefaults] setObject:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
//
//    return YES;
//
//}


#pragma mark 清楚缓存
+ (BOOL)clearAllCacheDataFromDisk
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [LQCacheManager shareMYCachesManager].cacheDirectoryPath;
    NSArray *arr = [fileManager subpathsAtPath:path];
    for (int i = 0; i < arr.count; i ++) {
        [fileManager removeItemAtPath:[path stringByAppendingPathComponent:arr[i]] error:nil];
    }
//    [SVProgressHUD showSuccessWithStatus:@"清除成功"];
    return YES;
}

@end
