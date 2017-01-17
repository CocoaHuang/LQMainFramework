//
//  LQTabBarView.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabBarSelectItem)(NSInteger index);

@interface LQTabBarView : UIView

@property (nonatomic, copy) TabBarSelectItem tabBarSelectItemBlock;

@property (nonatomic, assign) NSUInteger selectIndex;

- (void)addItemWithTitle:(NSString *)itemTitle normalImg:(NSString *)itemNormal selectImg:(NSString *)selectImg normalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor;


@end
