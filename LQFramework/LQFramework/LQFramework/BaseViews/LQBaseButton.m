//
//  LQBaseButton.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseButton.h"

@implementation LQBaseButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    if (CGRectEqualToRect(self.cusImgFrame, CGRectZero)) {
        return [super imageRectForContentRect:contentRect];
    }
    return self.cusImgFrame;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (CGRectEqualToRect(self.cusTitleFrame, CGRectZero)) {
        return [super titleRectForContentRect:contentRect];
    }
    return self.cusTitleFrame;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}

+ (instancetype)createBlockButton:(NSString *)title frame:(CGRect)frame event:(UIControlEvents)touchEvent clickBlock:(LQBaseButtonClick)clickBlock;
{
    LQBaseButton *btn = [LQBaseButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:touchEvent];
    btn.clickBlock = clickBlock;
    return btn;
}

- (void)btnClick:(LQBaseButton *)sender
{
    sender.clickBlock();
}

@end
