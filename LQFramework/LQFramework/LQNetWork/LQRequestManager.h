//
//  LQRequestManager.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQRequestConfigure.h"

@interface LQRequestManager : NSObject

@property (nonatomic, strong, readonly) NSURLSessionTask *task;

#pragma mark post/get 数据请求
+ (void)requestWithpath:(NSString *)path
                                   param:(NSDictionary *)parameters
                             requestType:(LQRequestType)requestType                       //请求类型
                                 success:(SuccessReturnBlock)successBlock
                                 failure:(FailureReturnBlock)failureBlock;


#pragma mark 单独设置超时时间
+ (void)requestWithpath:(NSString *)path
                  param:(NSDictionary *)parameters
                timeOut:(NSTimeInterval)timeoutInterval                  //超时
            requestType:(LQRequestType)requestType                       //请求类型
                success:(SuccessReturnBlock)successBlock
                failure:(FailureReturnBlock)failureBlock;

#pragma mark post/get 数据请求 (带缓存)
+ (void)requestWithCachePath:(NSString *)path
                                        param:(NSDictionary *)parameters
                                   isUseCache:(BOOL)isUseCache
                                  requestType:(LQRequestType)requestType                       //请求类型
                                      success:(SuccessReturnBlock)successBlock
                                      failure:(FailureReturnBlock)failureBlock;



#pragma mark 数据上传
+ (void)uploadAPIWithPath:(NSString *)path
                                     param:(NSDictionary *)parameters
                               requestType:(LQRequestType)requestType
                                    upload:(UploadDataBlock)uploadBlock
                                   success:(SuccessReturnBlock)successBlock
                                   failure:(FailureReturnBlock)failureBlock;



@end
