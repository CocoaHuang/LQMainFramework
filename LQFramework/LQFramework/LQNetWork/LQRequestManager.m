//
//  LQRequestManager.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQRequestManager.h"
#import "LQRequestParamsModel.h"
#import "LQRequestResult.h"
#import "LQRequestEngine.h"

@interface LQRequestManager ()



@end

@implementation LQRequestManager


#pragma mark 数据请求======================================================================
+ (void)requestWithpath:(NSString *)path
                  param:(NSDictionary *)parameters
            requestType:(LQRequestType)requestType                       //请求类型
                success:(SuccessReturnBlock)successBlock
                failure:(FailureReturnBlock)failureBlock
{
    
    
    
    
}

#pragma mark 单独设置超时时间
+ (void)requestWithpath:(NSString *)path
                  param:(NSDictionary *)parameters
                timeOut:(NSTimeInterval)timeoutInterval                  //超时
            requestType:(LQRequestType)requestType                       //请求类型
                success:(SuccessReturnBlock)successBlock
                failure:(FailureReturnBlock)failureBlock
{
    LQRequestParamsModel *requestParamsModel = [LQRequestParamsModel dataModelWithPath:path param:parameters requestType:requestType timeOut:timeoutInterval uploadProgressBlock:nil downloadProgressBlock:nil uploadBlock:nil success:^(NSURLSessionTask *task, id data) {
        LQRequestResult *sResult = [LQRequestResult dealWithSessionTask:task RequestData:data requestError:nil];
        successBlock(sResult);
    } failure:^(NSURLSessionTask *task, NSError *error) {
        LQRequestResult *fResult = [LQRequestResult dealWithSessionTask:task RequestData:nil requestError:error];
        failureBlock(fResult);
    }];
    [LQRequestManager callRequestWithParamsModel:requestParamsModel];
}

#pragma mark post/get 数据请求 (带缓存)
+ (void)requestWithCachePath:(NSString *)path
                       param:(NSDictionary *)parameters
                  isUseCache:(BOOL)isUseCache
                 requestType:(LQRequestType)requestType                       //请求类型
                     success:(SuccessReturnBlock)successBlock
                     failure:(FailureReturnBlock)failureBlock
{
    
}


#pragma mark 数据上传======================================================================
+ (void)uploadAPIWithPath:(NSString *)path
                    param:(NSDictionary *)parameters
              requestType:(LQRequestType)requestType
                   upload:(UploadDataBlock)uploadBlock
                  success:(SuccessReturnBlock)successBlock
                  failure:(FailureReturnBlock)failureBlock
{
    
}

#pragma mark 发起请求=======================================================================
#pragma mark 发起网络请求
+ (void)callRequestWithParamsModel:(LQRequestParamsModel *)dataModel
{
    [[LQRequestEngine sharedInstance] callRequestWithRequestModel:dataModel];
}




@end
