//
//  LQBaseControllerProtocol.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LQBaseControllerProtocol <NSObject>

//统一方法
@optional

- (void)firstLoadNewData;
- (void)setupForController;

@end
