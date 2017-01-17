//
//  LQBaseWebViewController.m
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/11.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseWKWebViewController.h"

@interface LQBaseWKWebViewController ()

@property (nonatomic, strong) NSTimer *loadTimer;
@property (nonatomic, strong) UIProgressView *loadProgress;
@property (nonatomic, assign) BOOL isUseProgress;
@property (nonatomic, assign) BOOL isSuccess;


@end

@implementation LQBaseWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_loadProgress removeFromSuperview];
    if (_loadTimer) {
        [_loadTimer invalidate];
        _loadTimer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupWKbViewWithFrame:(CGRect)iFame
{
    _isUseProgress = NO;
    self.mainWebView = [[WKWebView alloc] initWithFrame:iFame];
    self.mainWebView.navigationDelegate = self;
    self.mainWebView.UIDelegate = self;
}

- (void)starLoadRequestWithRequest:(NSURLRequest *)request isUseProgress:(BOOL)isUseProgress
{
    if (request == nil) {
        return;
    }
    _isSuccess = NO;
    if (isUseProgress) {
        _isUseProgress = isUseProgress;
        if (self.navigationController.navigationBar) {
            [self.navigationController.navigationBar addSubview:self.loadProgress];
        }
    }
    [self.mainWebView loadRequest:request];
}

#pragma mark Delegate


- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if (navigationAction.navigationType != WKNavigationTypeBackForward) {
        if (self.isUseProgress) {
            [self loadProgressStartLoad];
        }
    }
    if ([self respondsToSelector:@selector(lqWKWebViewdecidePolicyForNavigationAction:)]) {
        BOOL isCanLoad = [self lqWKWebViewdecidePolicyForNavigationAction:navigationAction];
        if (isCanLoad) {
            decisionHandler(WKNavigationActionPolicyAllow);
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    if (self.isUseProgress && !webView.isLoading) {
        [self loadProgressStopLoad];
    }
}

- (void)loadProgressStartLoad
{
    if (_isSuccess == NO) {
        [_loadProgress setAlpha:1.f];
        [_loadProgress setProgress:0.f];
        [self.loadTimer setFireDate:[NSDate distantPast]];
    }
}

- (void)loadProgressStopLoad
{
    [self.loadTimer setFireDate:[NSDate distantFuture]];
    if(_loadProgress) {
        _isSuccess = YES;
        [_loadProgress setProgress:1.0f animated:YES];
        [UIView animateWithDuration:0.6f delay:0.2f options:UIViewAnimationOptionCurveEaseOut animations:^{
            [_loadProgress setAlpha:0.0f];
        } completion:^(BOOL finished) {
            _isSuccess = NO;
            [_loadProgress setProgress:0.f];
        }];
    }
}

- (void)loadProgressDidFire:(NSTimer *)myTimer
{
    CGFloat increment = 0.005/(self.loadProgress.progress + 0.2);
    CGFloat progress = (self.loadProgress.progress < 0.75f) ? self.loadProgress.progress + increment : self.loadProgress.progress + 0.0005;
    if(self.loadProgress.progress < 0.95)
    {
        [self.loadProgress setProgress:progress animated:YES];
    }
}

- (BOOL)LQWebViewIsloading
{
    if (_mainWebView) {
        return [_mainWebView isLoading];
    }
    return [_mainWebView isLoading];
}

#pragma mark get And set
- (NSTimer *)loadTimer
{
    if (_loadTimer == nil) {
        _loadTimer = [NSTimer scheduledTimerWithTimeInterval:1.f/60.f target:self selector:@selector(loadProgressDidFire:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_loadTimer forMode:NSDefaultRunLoopMode];
    }
    return _loadTimer;
}

- (UIProgressView *)loadProgress
{
    if (_loadProgress == nil) {
        _loadProgress = [[UIProgressView alloc] initWithFrame:CGRectMake(0, NAV_DEFAULT_HEIGHT - 2, SCREEN_WIDTH, 2)];
        _loadProgress.progressTintColor = [UIColor redColor];
        _loadProgress.trackTintColor = [UIColor clearColor];
        [_loadProgress setProgress:0.f];
    }
    return _loadProgress;
}

- (void)dealloc
{
    if (_mainWebView) {
        _mainWebView.navigationDelegate = nil;
        _mainWebView.UIDelegate = nil;
    }
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
