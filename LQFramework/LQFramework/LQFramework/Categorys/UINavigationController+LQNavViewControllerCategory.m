//
//  UINavigationController+LQNavViewControllerCategory.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "UINavigationController+LQNavViewControllerCategory.h"
#import "LQBaseNavViewController.h"

@implementation UINavigationController (LQNavViewControllerCategory)

- (void)leftPopAboveViewController
{
    if (![self isMemberOfLQBaseNavViewController]) {
        return;
    }
    LQBaseNavViewController *nav = (LQBaseNavViewController *)self;
    [nav leftPopToViewControllerWithType:leftPopAbove];
}

- (void)leftPopRootViewController
{
    if (![self isMemberOfLQBaseNavViewController]) {
        return;
    }    LQBaseNavViewController *nav = (LQBaseNavViewController *)self;
    [nav leftPopToViewControllerWithType:leftPopRoot];
}

- (void)reSettingNav
{
    if (![self isMemberOfLQBaseNavViewController]) {
        return;
    }
    LQBaseNavViewController *nav = (LQBaseNavViewController *)self;
    [nav reSetting];
}

- (void)closeLeftPopGestureRecognizer:(BOOL)isCanUseLeftPopGestureRecognizer
{
    if (![self isMemberOfLQBaseNavViewController]) {
        return;
    }    LQBaseNavViewController *nav = (LQBaseNavViewController *)self;
    nav.isUseCusPop = !isCanUseLeftPopGestureRecognizer;
}

- (BOOL)isMemberOfLQBaseNavViewController
{
    if (![self isMemberOfClass:NSClassFromString(@"LQBaseNavViewController")])
    {
        return YES;
    }
    return NO;
}



@end
