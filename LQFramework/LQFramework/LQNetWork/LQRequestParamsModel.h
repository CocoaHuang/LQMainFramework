//
//  LQRequestParamsModel.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQRequestConfigure.h"


@interface LQRequestParamsModel : NSObject

//请求配置
/**
 *  网络请求参数
 */
@property (nonatomic, copy) NSString *requestPath;                  //网络请求url
@property (nonatomic, strong) NSDictionary *requestParams;          //请求参数
@property (nonatomic, assign) LQRequestType requestType;            //网络请求方式
@property (nonatomic, copy) successRequestBlock sRequestBlock;          //请求成功回调
@property (nonatomic, copy) failureRequestBlock fRequestBlock;          //请求失败回调

/**
 *  上传请求参参数配置
 */

@property (nonatomic, copy) UploadDataBlock uploadBlock;

/**
 *  下载请求参数配置
 */

/**
 *  进度配置
 */
@property (nonatomic, copy) ProgressBlock uploadProgressBlock;
@property (nonatomic, copy) ProgressBlock downloadProgressBlock;
//超时
@property (nonatomic, assign) NSTimeInterval timeoutInterval;


+ (instancetype)dataModelWithPath:(NSString *)requestPath
                                      param:(NSDictionary *)requestParams
                                requestType:(LQRequestType)requestType
                                    timeOut:(NSTimeInterval)timeoutInterval
                        uploadProgressBlock:(ProgressBlock)uploadProgressBlock
                      downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                                uploadBlock:(UploadDataBlock)uploadBlock
                                    success:(successRequestBlock)sRequestBlock
                                    failure:(failureRequestBlock)fRequestBlock;

@end
