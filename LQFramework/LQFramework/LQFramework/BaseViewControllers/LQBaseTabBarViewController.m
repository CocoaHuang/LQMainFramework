//
//  LQBaseTabBarViewController.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseTabBarViewController.h"
#import "LQBaseViewController.h"
#import "LQBaseNavViewController.h"
#import "LQTabBarView.h"

@interface LQBaseTabBarViewController ()

@property (nonatomic, strong) LQTabBarView *baseTabBarView;

@end

@implementation LQBaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    [self addSubNavController];
}

- (void)addSubNavController
{
    NSArray *itemTitleArr = @[@"盘搜",@"服务",@"个人"];
    NSArray *itemNormalImgArr = @[@"tabbar_home",@"tabbar_fuwu",@"tabbar_person"];
    NSArray *itemSelectImgArr = @[@"tabbar_home_sl",@"tabbar_fuwu_sl",@"tabbar_person_sl"];
    NSArray *itemSubNavArr = @[@"PSHomeMainController",@"ZYHomeGGViewController",@"PSPersonMainController"];
    for (int i = 0; i < itemTitleArr.count; i ++) {
        [self addNavControllWithName:itemSubNavArr[i] itemTitle:itemTitleArr[i] normalImage:itemNormalImgArr[i] selectImage:itemSelectImgArr[i] normalColor:COLOR_RGB_ALPHA(147, 147, 147,1) selectColor:COLOR_RGB_ALPHA(204, 34, 44,1)];
    }
    [self.tabBar addSubview:self.baseTabBarView];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    self.baseTabBarView.selectIndex = selectedIndex;
}

- (void)addNavControllWithName:(NSString *)vcName itemTitle:(NSString *)itemTitle normalImage:(NSString *)normalItemImage selectImage:(NSString *)selectItemImage normalColor:(UIColor *)normalColor selectColor:(UIColor *)selectColor
{
    Class vc = NSClassFromString(vcName);
    LQBaseViewController *rootVc = [[vc alloc] init];
    LQBaseNavViewController *navVc = [[LQBaseNavViewController alloc] initWithRootViewController:rootVc];
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:self.viewControllers];
    [muArr addObject:navVc];
    self.viewControllers = muArr;
    rootVc.hidesBottomBarWhenPushed = NO;
    
    [self.baseTabBarView addItemWithTitle:itemTitle normalImg:normalItemImage selectImg:selectItemImage normalColor:normalColor selectColor:selectColor];
}

- (LQTabBarView *)baseTabBarView
{
    if (_baseTabBarView == nil) {
        _baseTabBarView = [[LQTabBarView alloc] initWithFrame:self.tabBar.bounds];
        [_baseTabBarView setBackgroundColor:[UIColor whiteColor]];
        BLOCK_WEAK_SELF;
        _baseTabBarView.tabBarSelectItemBlock = ^(NSInteger index){
            mySelf.selectedIndex = index;
        };
    }
    return _baseTabBarView;
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
