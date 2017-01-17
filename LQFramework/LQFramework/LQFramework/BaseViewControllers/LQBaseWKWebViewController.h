//
//  LQBaseWKWebViewController.h
//  LQApp
//
//  Created by 杭州掌赢科技 on 2017/1/12.
//  Copyright © 2017年 HangZhouZhangYing. All rights reserved.
//

#import "LQBaseViewController.h"
#import <WebKit/WebKit.h>


@protocol LQBaseWKWebViewDelegate <NSObject>

@optional

- (BOOL)lqWKWebViewdecidePolicyForNavigationAction:(WKNavigationAction *)navigationAction;
- (void)lqWKWebViewDidFinishLoad;

@end


@interface LQBaseWKWebViewController : LQBaseViewController <WKUIDelegate,WKNavigationDelegate,LQBaseWKWebViewDelegate>

@property (nonatomic, strong) WKWebView *mainWebView;
- (void)setupWKbViewWithFrame:(CGRect)iFame;
- (void)starLoadRequestWithRequest:(NSURLRequest *)request isUseProgress:(BOOL)isUseProgress;


@end
