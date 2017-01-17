//
//  LQBaseButton.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^LQBaseButtonClick)();

@interface LQBaseButton : UIButton

@property (nonatomic, assign) CGRect cusTitleFrame;
@property (nonatomic, assign) CGRect cusImgFrame;
@property (nonatomic, copy) LQBaseButtonClick clickBlock;
+ (instancetype)createBlockButton:(NSString *)title frame:(CGRect)frame event:(UIControlEvents)touchEvent clickBlock:(LQBaseButtonClick)clickBlock;


@end
