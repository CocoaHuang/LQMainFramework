//
//  LQBaseTableView.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseTableView.h"

@implementation LQBaseTableView


- (void)registeSubViewForTableView:(NSArray *)subViewNameArr reuseIdentifier:(NSArray *)reuseIdentifierArr type:(TableRegisterTypeEnum)type
{
    switch (type) {
        case TableXibCellType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerNib:[UINib nibWithNibName:subViewNameArr[i] bundle:nil] forCellReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case TableClassCellType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerClass:NSClassFromString(subViewNameArr[i]) forCellReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case TableXibFootHeadType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerNib:[UINib nibWithNibName:subViewNameArr[i] bundle:nil] forHeaderFooterViewReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case TableClassFootHeadType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerClass:NSClassFromString(subViewNameArr[i]) forHeaderFooterViewReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark - Setup Methods
+ (instancetype)initListTable:(CGRect)iFame tableStyle:(UITableViewStyle)tableStyle withSeparatoStyle:(UITableViewCellSeparatorStyle)separatoStyle
{
    if (tableStyle == UITableViewStylePlain)
    {
        return [LQBaseTableView initPlainTable:iFame withSeparatoStyle:separatoStyle];
    }
    else {
        return [LQBaseTableView initGorupTable:iFame withSeparatoStyle:separatoStyle];
    }
}

+ (instancetype)initGorupTable:(CGRect)iFrame withSeparatoStyle:(UITableViewCellSeparatorStyle)style
{
    LQBaseTableView *listTable = [[LQBaseTableView alloc] initWithFrame:iFrame style:UITableViewStyleGrouped];
    listTable.separatorStyle = style;
    return listTable;
}

+ (instancetype)initPlainTable:(CGRect)iFrame withSeparatoStyle:(UITableViewCellSeparatorStyle)style
{
    LQBaseTableView *listTable = [[LQBaseTableView alloc] initWithFrame:iFrame style:UITableViewStylePlain];
    listTable.separatorStyle = style;
    return listTable;
}

@end
