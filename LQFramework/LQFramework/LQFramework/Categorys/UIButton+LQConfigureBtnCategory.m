//
//  UIButton+LQConfigureBtnCategory.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "UIButton+LQConfigureBtnCategory.h"

@implementation UIButton (LQConfigureBtnCategory)

+ (void)load
{
    //xib
    Method sysXibInit = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myXibInit = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(sysXibInit, myXibInit);
    
    //代码创建
    Method sysInitFrame = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method myInitFrame = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
    method_exchangeImplementations(sysInitFrame, myInitFrame);
}

- (instancetype)myInitWithCoder:(NSCoder *)aDecoder
{
    if ([self myInitWithCoder:aDecoder])
    {
        [self configureFontSize];
    }
    return self;
}

- (instancetype)myInitWithFrame:(CGRect)frame
{
    if([self myInitWithFrame:frame])
    {
        [self configureFontSize];
    }
    return self;
}

- (void)configureFontSize
{
    if (DEVICE_IS_IPHONE_6 || DEVICE_IS_IPHONE_6P)
    {
        return;
    }
    else
    {
        CGFloat currentFontSize = self.titleLabel.font.pointSize;
        self.titleLabel.font = [UIFont systemFontOfSize:IFRAME_SCALE_WIDTH(currentFontSize)];
    }
}


@end
