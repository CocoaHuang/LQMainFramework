//
//  LQRequestResult.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQRequestResult.h"

@implementation LQRequestResult

+ (instancetype)dealWithSessionTask:(NSURLSessionTask *)task
                        RequestData:(id)responseObject
                       requestError:(NSError *)error
{
    LQRequestResult *result = [[LQRequestResult alloc] init];
    [result setupResult];
    if (error) {
        [result dealWithRequestError:error sessionTask:task];
    }
    else {
        [result dealWithRequestData:responseObject sessionTask:task];
    }
    return result;
}

- (void)setupResult
{
    _isExistData = NO;
    _requestTask = nil;
    _cusDictData = nil;
    _cusModelDataArr = nil;
    _requestError = nil;
    _requestErrorMsg = nil;
    _originalData = nil;
    _serverErrorMsg = nil;
    _responseCode = 0;
}

/**
 *  处理失败数据
 *
 *  @param error
 */

- (void)dealWithRequestError:(NSError *)error sessionTask:(NSURLSessionTask *)task
{
    self.requestTask = task;
    self.requestError = error;
    NSInteger responseCode  = error.code;
    self.responseCode = responseCode;
    switch (responseCode)
    {
        case kCFURLErrorTimedOut:
        {
            //超时
            self.requestErrorMsg = @"请求超时";
            break;
        }
        case kCFURLErrorNotConnectedToInternet:
        {
            //网络无法连接
            self.requestErrorMsg = @"当前网络不可用";
            break;
        }
        default:
        {
            // 未知错误不进行判断
            self.requestErrorMsg = @"请稍后";
            break;
        }
    }
}

/**
 *  处理成功数据
 *
 *  @param error
 */
- (void)dealWithRequestData:(id)responseObject sessionTask:(NSURLSessionTask *)task
{
    self.requestTask = task;
    if (!responseObject) {
        return;
    }
    self.originalData = responseObject;
    self.isExistData = [self verifyRequestData:responseObject];
}

/**
 验证数据是否有效
 */
- (BOOL)verifyRequestData:(id)responseObject
{
    if ([[responseObject valueForKey:@"result"] isEqualToNumber:@1])
    {
        return YES;
    }
    else {
        return NO;
        //出错原因
    }
}
@end
