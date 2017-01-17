//
//  LQRequestConfigure.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#ifndef LQRequestConfigure_h
#define LQRequestConfigure_h


#pragma mark 网络请求环境
//测试
//#define INTERFACE_SERVE @"www.chaojifan.com"
//#define INTERFACE_SERVE_TEST @"http://dev.chaojifan.com"

//正式
#define INTERFACE_SERVE_TEST @"http://www.pansou.com"


#pragma mark 服务器
typedef NS_ENUM(NSUInteger, MYServiceType)
{
    ServiceA,      //A服务器
    ServiceB,      //B服务器
};

#pragma mark 请求类型
typedef NS_ENUM (NSUInteger, LQRequestType) {
    LQRequestTypeGet,                    //get请求
    LQRequestTypePost,                   //POST请求
    LQRequestTypePostUpload,             //POST数据请求
    LQRequestTypeGETDownload             //下载文件请求，不做返回值解析
};

typedef NS_ENUM(NSInteger, DataEngineAlertType) {
    DataEngineAlertType_None,
    DataEngineAlertType_Toast,
    DataEngineAlertType_Alert,
    DataEngineAlertType_ErrorView
};

#import "AFNetworking.h"
#pragma mark 处理类型
typedef void (^ProgressBlock)(NSProgress *taskProgress);                     //进度block
typedef void (^successRequestBlock)(NSURLSessionTask *task, id data);           //成功回调block
typedef void (^failureRequestBlock)(NSURLSessionTask *task, NSError *error);    //失败回调block
typedef void (^UploadDataBlock)(id<AFMultipartFormData>uploadHelp);          //上传block

@class LQRequestResult;
#pragma mark 最终返回值
typedef void (^SuccessReturnBlock)(LQRequestResult *result);       //回调block
typedef void (^FailureReturnBlock)(LQRequestResult *result);       //回调block



#endif /* LQRequestConfigure_h */
