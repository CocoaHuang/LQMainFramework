//
//  LQBaseCollectionView.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseCollectionView.h"

@implementation LQBaseCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)initCollectionView:(CGRect)iFame collectionViewLayout:(UICollectionViewLayout *)layout
{
    return [[LQBaseCollectionView alloc] initWithFrame:iFame collectionViewLayout:layout];
}

- (void)registeSubViewForCollectionView:(NSArray *)subViewNameArr reuseIdentifier:(NSArray *)reuseIdentifierArr type:(CollectRegisterTypeEnum)type
{
//    CollectXibCellType,
//    CollectClassCellType,
//    CollectXibHeadType,
//    CollectXibFootType,
//    CollectClassHeadType,
//    CollectClassFootType,
    switch (type) {
        case CollectXibCellType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerNib:[UINib nibWithNibName:subViewNameArr[i] bundle:nil] forCellWithReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case CollectClassCellType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerClass:NSClassFromString(subViewNameArr[i]) forCellWithReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case CollectXibHeadType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerNib:[UINib nibWithNibName:subViewNameArr[i] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case CollectXibFootType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerNib:[UINib nibWithNibName:subViewNameArr[i] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case CollectClassHeadType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerClass:NSClassFromString(subViewNameArr[i]) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        case CollectClassFootType:
        {
            for (int i = 0; i < subViewNameArr.count; i ++) {
                [self registerClass:NSClassFromString(subViewNameArr[i]) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:reuseIdentifierArr[i]];
            }
            break;
        }
        default:
            break;
    }
}

@end
