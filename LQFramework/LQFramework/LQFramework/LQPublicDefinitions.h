//
//  LQPublicDefinitions.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#ifndef LQPublicDefinitions_h
#define LQPublicDefinitions_h

#ifdef DEBUG
#define MY_Log(...) NSLog(__VA_ARGS__)
#define MY_debug_Method() NSLog(@"%s", __func__)
#else
#define MY_Log(...)
#define MY_debug_Method()
#endif

/**
 *  系统的版本
 */
#define TARGET_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define TARGET_IS_IOS10_OR_LATER    (TARGET_SYSTEM_VERSION >= 10.0)
#define TARGET_IS_IOS9_OR_LATER    (TARGET_SYSTEM_VERSION >= 9.0)
#define TARGET_IS_IOS8_OR_LATER    (TARGET_SYSTEM_VERSION >= 8.0)
#define TARGET_IS_IOS7_OR_LATER    (TARGET_SYSTEM_VERSION >= 7.0)
#define TARGET_IS_IOS6_OR_LATER    (TARGET_SYSTEM_VERSION >= 6.0)

/**
 *  判断设备是否是iPad
 */
#define DEVICE_IS_IPAD              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 *  判断设备是否是iPhone
 */
#define DEVICE_IS_IPHONE            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/**
 *  判断设备是否是Retina屏
 */
#define DEVICE_IS_RETINA            ([[UIScreen mainScreen] scale] >= 2.0)

/**
 *  设备屏幕的宽度
 */
#define DEVICE_SCREEN_WIDTH         ([[UIScreen mainScreen] bounds].size.width)

/**
 *  设备屏幕的高度
 */
#define DEVICE_SCREEN_HEIGHT        ([[UIScreen mainScreen] bounds].size.height)

/**
 *  设备屏幕的最大长度
 */
#define DEVICE_SCREEN_MAX_LENGTH    (MAX(DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT))

/**
 *  设备屏幕的最小长度
 */
#define DEVICE_SCREEN_MIN_LENGTH    (MIN(DEVICE_SCREEN_WIDTH, DEVICE_SCREEN_HEIGHT))

/**
 *  设备的类型
 */
#define DEVICE_IS_IPHONE_4_OR_LESS  (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH < 568.0)
#define DEVICE_IS_IPHONE_5          (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH == 568.0)
#define DEVICE_IS_IPHONE_6_OR_LESS  (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH < 667.0)
#define DEVICE_IS_IPHONE_6          (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH == 667.0)
#define DEVICE_IS_IPHONE_6P         (DEVICE_IS_IPHONE && DEVICE_SCREEN_MAX_LENGTH == 736.0)

/**
 *  屏幕的宽高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size

//nav，tabbar，statusbar高度
#define STATUSBAR_HEIGHT  [[UIApplication sharedApplication] statusBarFrame].size.height
#define STATUSBAR_WIDTH   [[UIApplication sharedApplication] statusBarFrame].size.width
#define STATUSBAR_FRAME   [[UIApplication sharedApplication] statusBarFrame]
#define STATUSBAR_DEFAULT_HEIGHT 20.f

#define NAV_HEIGHT  self.navigationController.navigationBar.size.height
#define NAV_WIDTH   self.navigationController.navigationBar.size.width
#define NAV_FRAME   self.navigationController.navigationBar.frame
#define NAV_DEFAULT_HEIGHT 44.f
#define TABBAR_DEFAULT_DEIGHT 49.f
#define NAV_AND_TABBAR_HEIGHT 113.f
#define NAV_AND_STATUSBAR_HEIGHT 64.f

//屏幕比
#define SCREEN_SCALE_WIDTH [UIScreen mainScreen].bounds.size.width / 375.f
#define SCREEN_SCALE_HEIGHT [UIScreen mainScreen].bounds.size.height / 667.f
#define IFRAME_SCALE_WIDTH(width) SCREEN_SCALE_WIDTH * width
#define IFRAME_SCALE_HEIGHT(height) SCREEN_SCALE_WIDTH * height


#define BLOCK_WEAK_SELF    __weak __typeof(self)mySelf = self;
#define BLOCK_STRONG_SELF  __strong __typeof(self)strongSelf = self;

//------------------------------------------------------------------------------------------------
/**
 *  工具
 */
#define COLOR_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.f]
#define COLOR_RGB_ALPHA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define NAV_ITEM_TITLE(titleStr) [self.navigationItem setTitle:titleStr]
#define NAV_ITEM_TITLEVIEW(titleView) [self.navigationItem setTitleView:titleView]




#endif /* LQPublicDefinitions_h */
