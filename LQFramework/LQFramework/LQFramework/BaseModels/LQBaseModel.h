//
//  LQBaseModel.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQBaseModel : NSObject

#pragma mark 数据解析
+ (instancetype)resolveSingleModel:(id)responseObject;
+ (NSArray *)resolveArrayModel:(id)responseObject;

#pragma mark 数据去从重
+ (NSMutableArray *)deleteRepeatData:(NSArray *)dataArr modelArr:(NSArray *)modelArr deleteStr:(NSString *)str;


@end
