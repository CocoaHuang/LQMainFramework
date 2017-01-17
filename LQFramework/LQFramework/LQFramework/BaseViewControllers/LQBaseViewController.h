//
//  LQBaseViewController.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQBaseControllerProtocol.h"
#import "LQAppDelegateProtocol.h"

@interface LQBaseViewController : UIViewController <LQBaseControllerProtocol, LQAppDelegateProtocol>

@end
