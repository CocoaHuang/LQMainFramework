//
//  LQBaseNavViewController.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/10.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseNavViewController.h"


@interface LQBaseNavViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *panPop;
@property (nonatomic, strong) UIImageView *insertImg;
@property (nonatomic, strong) NSMutableArray *insertImgArr;
@property (nonatomic, assign) CGPoint panBeginPoint;
@property (nonatomic, assign) CGPoint panEndPoint;

@property (nonatomic, assign) NSInteger removeTargetNum;
@property (nonatomic, assign) LeftPopState popState;


@end

@implementation LQBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupController];
}

- (void)setupController
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
//    self.view.layer.shadowColor = COLOR_RGB(130, 130, 130).CGColor;
//    self.view.layer.shadowOffset = CGSizeMake(- 5, 0);
//    self.view.layer.shadowOpacity = 0.2;
//    self.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
    [self reSetting];
    [self.view addGestureRecognizer:self.panPop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    //截屏
    [self cutOutCurrentControllerImg];
    [super pushViewController:viewController animated:animated];
}

#pragma mark pop
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.insertImgArr removeLastObject];
    return [super popViewControllerAnimated:animated];
}

- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.insertImgArr removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}

//截取当前屏幕的图片
- (void)cutOutCurrentControllerImg
{
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, 0.0f);
    //UIGraphicsGetCurrentContext 取站顶
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *cutOutImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.insertImgArr addObject:cutOutImg];
}

- (void)panGestureRecognizerAction:(UIScreenEdgePanGestureRecognizer *)panGestureRecognizer
{
    if ([self.viewControllers count] == 1)
    {
        return;
    }
    if (panGestureRecognizer.state == UIGestureRecognizerStatePossible) {
        return;
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        //存放滑动开始的位置
        _panBeginPoint = [panGestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow];
        [self insertLastViewFromSuperView:self.view.superview];
    }
    else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGFloat panLength = ([panGestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow].x - _panBeginPoint.x);
        if (panLength > 0)
        {
            [self moveNavigationViewWithLenght:panLength];
        }
    }
    else {
        self.panEndPoint = [panGestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow];
        //滑动距离大于50，pop
        if ((_panEndPoint.x - _panBeginPoint.x) > 50)
        {
            [UIView animateWithDuration:0.3 animations:^{
                [self moveNavigationViewWithLenght:[UIScreen mainScreen].bounds.size.width];
            } completion:^(BOOL finished)
             {
                 if (self.popState == leftPopAbove) {
                     [self popViewControllerAnimated:NO];
                 }
                 else {
                     [self popToRootViewControllerAnimated:YES];
                 }
                 [self moveNavigationViewWithLenght:0];
                 [self removeLastViewFromSuperView];
             }];
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                [self moveNavigationViewWithLenght:0];
            } completion:^(BOOL finished) {
                [self removeLastViewFromSuperView];
            }];
        }
    }
}

/**
 *  插图上一级图片
 *
 *  @param superView 图片的superView
 */
- (void)insertLastViewFromSuperView:(UIView *)superView
{
    self.insertImg.frame = CGRectMake(- (SCREEN_WIDTH / 3) * 2, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    if (self.popState == leftPopAbove) {
        self.insertImg.image = [self.insertImgArr lastObject];;
    }
    else {
        self.insertImg.image = [self.insertImgArr firstObject];;
    }
    [superView insertSubview:self.insertImg belowSubview:self.view];
}

/**
 *  移动视图界面
 *
 *  @param lenght 移动的长度
 */
- (void)moveNavigationViewWithLenght:(CGFloat)lenght
{
    
    
    //图片位置设置
    self.view.frame = CGRectMake(lenght, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    self.insertImg.frame = CGRectMake(- (SCREEN_WIDTH / 3) * 2 + lenght / 3 * 2, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

/**
 *  移除上一级图片
 */
- (void)removeLastViewFromSuperView {
    [self.insertImg removeFromSuperview];
}

#pragma mark - Private Methods
- (void)leftPopToViewControllerWithType:(LeftPopState)popState
{
    self.popState = popState;
    [self insertLastViewFromSuperView:self.view.superview];
    [UIView animateWithDuration:0.3 animations:^{
        [self moveNavigationViewWithLenght:[UIScreen mainScreen].bounds.size.width];
    } completion:^(BOOL finished)
     {
         if (self.popState == leftPopAbove) {
             [self popViewControllerAnimated:NO];
         }
         else {
             [self popToRootViewControllerAnimated:YES];
         }
         [self moveNavigationViewWithLenght:0];
         [self removeLastViewFromSuperView];
     }];
}

- (void)reSetting
{
    self.popState = leftPopAbove;
    self.isUseCusPop = YES;
}

#pragma mark - Getters And Setters
- (void)setIsUseCusPop:(BOOL)isUseCusPop
{
    self.panPop.enabled = isUseCusPop;
}

- (UIScreenEdgePanGestureRecognizer *)panPop
{
    if (_panPop == nil) {
        _panPop = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
        _panPop.edges = UIRectEdgeLeft;
    }
    return _panPop;
}

- (UIImageView *)insertImg
{
    if (_insertImg == nil) {
        _insertImg = [[UIImageView alloc] init];
    }
    return _insertImg;
}

- (NSMutableArray *)insertImgArr
{
    if (_insertImgArr == nil) {
        _insertImgArr = [NSMutableArray array];
    }
    return _insertImgArr;
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
