//
//  ViewController.m
//  UIWebViewAndUIActivityIndicatorSample
//
//  Created by Dolice on 2013/12/31.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property UIWebView               *webView;   // ウェブビュー
@property UIActivityIndicatorView *indicator; // アクティビティインジケータ

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // ウェブビュー配置
    [self setWebView];
    
    // ウェブビューにページ読み込み
    [self loadWebPageForWebView];

    // アクティビティインジケータ表示
    [self startActiviryIndicatorAnimation];
}

#pragma mark - Web View

// ウェブビュー配置
- (void)setWebView
{
    _webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    _webView.opaque = NO;
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
}

// ウェブビューにページ読み込み
- (void)loadWebPageForWebView
{
    NSURL *url = [NSURL URLWithString:@"http://dolice.net/mb/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

// ページ読込開始時にインジケータ表示
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // ステータスバーのインジケータ表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// ページ読込完了時にインジケータ非表示
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // アクティビティインジケータ非表示
    [self stopActivityIndicatorAnimation];
    
    // ステータスバーのインジケータ非表示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark - Activity Indicator

// アクティビティインジケータ表示
- (void)startActiviryIndicatorAnimation
{
    _indicator = [[UIActivityIndicatorView alloc] init];
    _indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _indicator.frame = CGRectMake(0, 0, 20, 20);
    _indicator.center = self.view.center;
    _indicator.hidesWhenStopped = YES;
    [_indicator startAnimating];
    [self.view addSubview:_indicator];
}

// アクティビティインジケータ非表示
- (void)stopActivityIndicatorAnimation
{
    [_indicator stopAnimating];
}

@end
