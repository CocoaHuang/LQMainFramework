//
//  LQPageTransitionManager.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/13.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LQPageShareManager [LQPageTransitionManager sharePageTransitionManager]

@interface LQPageTransitionManager : NSObject

+ (instancetype)sharePageTransitionManager;
@property (nonatomic, weak) UIViewController *currentViewController;
@property (nonatomic, weak) UINavigationController * currentNavigationController;

/**
 本地调用

 @param vcName
 @param params
 @param animated
 */
- (void)nativeTransitionToViewControllerWithName:(NSString *)vcName andParams:(NSDictionary *)params animated:(BOOL)animated;


@end
