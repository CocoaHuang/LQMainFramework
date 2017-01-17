//
//  LQBaseTableView.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, TableRegisterTypeEnum)
{
    TableXibCellType,
    TableClassCellType,
    TableXibFootHeadType,
    TableClassFootHeadType,
};

@interface LQBaseTableView : UITableView

+ (instancetype)initListTable:(CGRect)iFame tableStyle:(UITableViewStyle)tableStyle withSeparatoStyle:(UITableViewCellSeparatorStyle)separatoStyle;

/**
 *
 *  @param xibNameArr nil
 */
- (void)registeSubViewForTableView:(NSArray *)subViewNameArr reuseIdentifier:(NSArray *)reuseIdentifierArr type:(TableRegisterTypeEnum)type;


@end
