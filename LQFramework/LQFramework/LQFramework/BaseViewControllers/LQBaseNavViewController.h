//
//  LQBaseNavViewController.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LeftPopState)
{
    leftPopAbove,        //默认
    leftPopRoot,
};


@interface LQBaseNavViewController : UINavigationController

- (void)leftPopToViewControllerWithType:(LeftPopState)popState;
- (void)reSetting;

//是否启用返回手势
@property (nonatomic, assign) BOOL isUseCusPop;

@end
