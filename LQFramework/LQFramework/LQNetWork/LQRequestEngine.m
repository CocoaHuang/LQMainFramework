//
//  LQRequestManager.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQRequestEngine.h"
#import "LQRequestParamsModel.h"
#import "AFNetWorking.h"

@interface LQRequestEngine ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

/**
 * 存储 task 的字典，用于自动取消网络请求
 */
@property (nonatomic, strong) NSMutableDictionary *taskMuDict;

@end

@implementation LQRequestEngine

+ (instancetype)sharedInstance
{
    static LQRequestEngine *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LQRequestEngine alloc] init];
        [instance sessionManager];
    });
    return instance;
}

#pragma mark 发起网络请求
- (void)callRequestWithRequestModel:(LQRequestParamsModel *)requestModel
{
    if (!requestModel) {
        return;
    }
    NSURLSessionTask *task = [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
    if (task) {
        [task cancel];
    }
    switch (requestModel.requestType) {
        case LQRequestTypeGet:
        {
            task = [self getRequest:requestModel];
            break;
        }
        case LQRequestTypePost:
        {
            
            task = [self postRequest:requestModel];
            break;
        }
        case LQRequestTypePostUpload:
        {
            task = [self postUploadRequest:requestModel];
        }
        default:
            break;
    }
    [[LQRequestEngine sharedInstance] setValue:task forKey:requestModel.requestPath];
}

#pragma mark 移除成功的请求task
- (NSURLSessionTask *)removeTaskFormContainer:(NSString *)keyStr
{
    NSURLSessionTask *task = nil;
    if ([[LQRequestEngine sharedInstance].taskMuDict valueForKey:keyStr])
    {
        task = [[LQRequestEngine sharedInstance].taskMuDict valueForKey:keyStr];
    }
    return task;
}

#pragma mark rquest--------------------------------------------------------------------------
- (NSURLSessionTask *)getRequest:(LQRequestParamsModel *)requestModel
{
    NSURLSessionDataTask *task = [self.sessionManager GET:requestModel.requestPath parameters:requestModel.requestParams progress:^(NSProgress * _Nonnull downloadProgress) {
        if (requestModel.downloadProgressBlock) {
            requestModel.downloadProgressBlock(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
        if (requestModel.sRequestBlock) {
            requestModel.sRequestBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
        if ((requestModel.fRequestBlock)) {
            requestModel.fRequestBlock(task,error);
        }
    }];
    return task;
}

#pragma mark post
- (NSURLSessionTask *)postRequest:(LQRequestParamsModel *)requestModel
{
    NSURLSessionDataTask *task = [self.sessionManager POST:requestModel.requestPath parameters:requestModel.requestParams progress:^(NSProgress * _Nonnull uploadProgress) {
        if (requestModel.uploadProgressBlock) {
            requestModel.uploadProgressBlock(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
        if (requestModel.sRequestBlock) {
            requestModel.sRequestBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
        if (requestModel.fRequestBlock) {
            requestModel.fRequestBlock(task,error);
        }
    }];
    return task;
}

#pragma mark postUploadRequest
- (NSURLSessionTask *)postUploadRequest:(LQRequestParamsModel *)requestModel
{
    NSURLSessionDataTask *task = [self.sessionManager POST:requestModel.requestPath parameters:requestModel.requestParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (requestModel.uploadBlock) {
            requestModel.uploadBlock(formData);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
        if (requestModel.sRequestBlock) {
            requestModel.sRequestBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[LQRequestEngine sharedInstance] removeTaskFormContainer:requestModel.requestPath];
        if (requestModel.fRequestBlock) {
            requestModel.fRequestBlock(task,error);
        }
    }];
    return task;
}

#pragma mark set And get
- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.timeoutInterval = 40;
        _sessionManager.responseSerializer.acceptableContentTypes =  [_sessionManager.responseSerializer.acceptableContentTypes setByAddingObjectsFromSet:[NSSet setWithObjects:@"text/html",nil]];
    }
    return _sessionManager;
}



@end
