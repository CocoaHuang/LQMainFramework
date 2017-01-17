//
//  LQPageTransitionManager.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/13.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQPageTransitionManager.h"

static LQPageTransitionManager *pageManager;

@implementation LQPageTransitionManager

+ (instancetype)sharePageTransitionManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pageManager = [[LQPageTransitionManager alloc] init];
        pageManager.currentViewController = nil;
        pageManager.currentNavigationController = nil;
    });
    return pageManager;
}

- (UINavigationController *)currentNavigationController
{
    if (pageManager.currentViewController) {
        return pageManager.currentViewController.navigationController;
    }
    return nil;
}

- (void)nativeTransitionToViewControllerWithName:(NSString *)vcName andParams:(NSDictionary *)params animated:(BOOL)animated
{
    UIViewController *pushController = [LQPageTransitionManager createViewControllerFromName:vcName params:params];
    if (!pushController) {
        return;
    }
    [pageManager.currentNavigationController pushViewController:pushController animated:animated];
}

#pragma mark 根据名称创建viewController，并将params的数据赋值给viewController
+ (UIViewController *)createViewControllerFromName:(NSString *)name params:(NSDictionary *)params {
    
    Class class = NSClassFromString(name);
    if (!class || ![class isSubclassOfClass:[UIViewController class]])
    {
        return nil;
    }
    UIViewController *targetViewController = [[class alloc] init];
    if (params && ![params isKindOfClass:[NSDictionary class]]) {
        targetViewController.transParamsDict = params;
    }
    return targetViewController;
}



@end
