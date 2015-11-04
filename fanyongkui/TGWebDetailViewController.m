//
//  TGWebDetailViewController.m
//  fanyongkui
//
//  Created by qingyun on 15/11/3.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "TGWebDetailViewController.h"

@interface TGWebDetailViewController ()<UIWebViewDelegate>

@end

@implementation TGWebDetailViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详情";
    
    UIWebView *webView=[[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate=self;
    
    [self.view addSubview:webView];
    
    NSURL *url=[NSURL URLWithString:self.urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    // Do any additional setup after loading the view.
}

#pragma mark-UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
