//
//  LQBaseModel.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseModel.h"

@implementation LQBaseModel

+ (instancetype)resolveSingleModel:(id)responseObject
{
    return nil;
}

+ (NSArray *)resolveArrayModel:(id)responseObject
{
    return nil;
}

#pragma mark 数据去从
/**
 *
 *
 *  @param dataArr  数据数组
 *  @param modelArr 获取的模型数组(请求的)
 *  @param str      根据字段去从
 *
 *  @return 新的数据数组
 */
+ (NSMutableArray *)deleteRepeatData:(NSArray *)dataArr modelArr:(NSArray *)modelArr deleteStr:(NSString *)str
{
    NSMutableArray *newDataArr = [NSMutableArray array];
    if (dataArr.count == 0) {
        //不用去从
        return (NSMutableArray *)modelArr;
    }
    else
    {
        for (LQBaseModel *model1 in modelArr)
        {
            for (int i = 0; i < dataArr.count; i ++)
            {
                LQBaseModel *model2 = dataArr[i];
                if ([[model1 valueForKey:str] isEqualToString:[model2 valueForKey:str]])
                {
                    break;
                }
                else
                {
                    if (i == dataArr.count - 1)
                    {
                        [newDataArr addObject:model1];
                    }
                    else
                    {
                        continue;
                    }
                }
            }
        }
    }
    NSMutableArray *muDataArr = [NSMutableArray arrayWithArray:dataArr];
    for (int i = 0; i < newDataArr.count; i ++) {
        [muDataArr addObject:newDataArr[i]];
    }
    return muDataArr;
}


@end
