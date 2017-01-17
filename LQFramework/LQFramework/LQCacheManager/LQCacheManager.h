//
//  LQCacheManager.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/13.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQCacheManager : NSObject

@property (nonatomic, copy) NSString *cacheDirectoryPath;


+ (instancetype)shareMYCachesManager;

//1.永久缓存    2.定时缓存
/**
 归档存储数据
 
 @param saveData          数据
 @param fileName 文件名（请求的url）
 @param invalidTimeLength 过期时间 0(不会过期)
 
 @return
 */
+ (BOOL)saveDataWithData:(id)saveData fileName:(NSString *)fileName invalidTimeLength:(NSString *)invalidTimeLength;

/**
 读取缓存
 
 @param fileName 文件名（请求的url）
 
 @return
 */
+ (NSDictionary *)readMYCacheData:(NSString *)fileName;

//+ (NSDictionary *)saveDataWithPlistFile:(id)saveData;

/**
 清楚缓存
 */
+ (BOOL)clearAllCacheDataFromDisk;


@end
