//
//  LQRequestParamsModel.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/14.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQRequestParamsModel.h"

@implementation LQRequestParamsModel

+ (instancetype)dataModelWithPath:(NSString *)requestPath
                            param:(NSDictionary *)requestParams
                      requestType:(LQRequestType)requestType
                          timeOut:(NSTimeInterval)timeoutInterval
              uploadProgressBlock:(ProgressBlock)uploadProgressBlock
            downloadProgressBlock:(ProgressBlock)downloadProgressBlock
                      uploadBlock:(UploadDataBlock)uploadBlock
                          success:(successRequestBlock)sRequestBlock
                          failure:(failureRequestBlock)fRequestBlock
{
    LQRequestParamsModel *dataModel = [[LQRequestParamsModel alloc]init];
    dataModel.requestPath = requestPath;
    dataModel.requestParams = requestParams;
    dataModel.requestType = requestType;
    dataModel.uploadProgressBlock = uploadProgressBlock;
    dataModel.downloadProgressBlock = downloadProgressBlock;
    dataModel.uploadBlock = uploadBlock;
    dataModel.sRequestBlock = sRequestBlock;
    dataModel.fRequestBlock = fRequestBlock;
    dataModel.timeoutInterval = timeoutInterval;
    return dataModel;
}


@end
