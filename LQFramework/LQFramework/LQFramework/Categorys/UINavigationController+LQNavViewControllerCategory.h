//
//  UINavigationController+LQNavViewControllerCategory.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LQNavViewControllerCategory)

- (void)leftPopAboveViewController;
- (void)leftPopRootViewController;

- (void)closeLeftPopGestureRecognizer:(BOOL)isCanUseLeftPopGestureRecognizer;

- (void)reSettingNav;

@end
