//
//  LQBaseViewController.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseViewController.h"
#import "LQPageTransitionManager.h"

@interface LQBaseViewController ()

@end

@implementation LQBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self changeAppDelegateProtocolObject];
    
}

- (void)changeAppDelegateProtocolObject
{
//    AppDelegate *myApp = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    myApp.appGobalDelegate = self;
//    [LQPageTransitionManager sharePageTransitionManager].currentViewController = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
