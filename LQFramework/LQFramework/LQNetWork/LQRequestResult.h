//
//  LQRequestResult.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQRequestResult : NSObject

/**
 *  请求操作相应码
 */
@property (nonatomic, assign) NSInteger responseCode;

/**
 *  错误 error
 */
@property (nonatomic, strong) NSError *requestError;

/**
 *  请求失败时的错误原因
 */
@property (nonatomic, copy) NSString *requestErrorMsg;


/**
 *  服务返回的出错信息
 */
@property (nonatomic, copy) NSString *serverErrorMsg;

/**
 *  请求获取的数据 responseObject（原始数据）
 */
@property (nonatomic, strong) id originalData;

/**
 *  数据：模型数组
 */
@property (nonatomic, strong) NSArray *cusModelDataArr;

/**
 *  数据：任意数据
 */
@property (nonatomic, strong) NSDictionary *cusDictData;

/**
 *  是否存在数据
 */
@property (nonatomic, assign) BOOL isExistData;

@property (nonatomic, strong) NSURLSessionTask *requestTask;

/**
 *  网络请求的结果处理
 *
 *  @param responseObject 成功数据
 *  @param error          失败错误
 *  @param task           请求的任务
 *
 *  @return
 */
+ (instancetype)dealWithSessionTask:(NSURLSessionTask *)task
                        RequestData:(id)responseObject
                       requestError:(NSError *)error;



@end
