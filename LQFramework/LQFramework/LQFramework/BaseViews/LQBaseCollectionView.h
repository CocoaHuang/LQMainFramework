//
//  LQBaseCollectionView.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CollectRegisterTypeEnum)
{
    CollectXibCellType,
    CollectClassCellType,
    CollectXibHeadType,
    CollectXibFootType,
    CollectClassHeadType,
    CollectClassFootType,
};

@interface LQBaseCollectionView : UICollectionView

+ (instancetype)initCollectionView:(CGRect)iFame collectionViewLayout:(UICollectionViewLayout *)layout;


- (void)registeSubViewForCollectionView:(NSArray *)subViewNameArr reuseIdentifier:(NSArray *)reuseIdentifierArr type:(CollectRegisterTypeEnum)type;


@end
