//
//  GGThirdPartyLoginVC.m
//  GGShareDemo
//
//  Created by dujia on 16/7/18.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGThirdPartyLoginVC.h"

static float const GGTopViewHeight = 62;

@interface GGThirdPartyLoginVC()
@property (nonatomic , strong) UIWebView *oauthWebView;

@property (nonatomic , strong) UIView *topView;
@property (nonatomic , strong) UIButton *backBtn;


@end

@implementation GGThirdPartyLoginVC

- (void) viewDidLoad
{
    [super viewDidLoad];
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, GGTopViewHeight)];
    _topView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_topView];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    
    _backBtn.frame = CGRectMake(0, (GGTopViewHeight - 30) / 2, 80, 30);
    [_backBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    [_backBtn setTitle:@"返 回" forState:UIControlStateNormal];
    [_topView addSubview:_backBtn];
    
   
    self.oauthWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, GGTopViewHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - GGTopViewHeight)];
    
    [self.view addSubview:self.oauthWebView];
    self.oauthWebView.delegate = self;
    
    
    
}


- (void)requestUrl:(NSString *)urlstring delegate:(id)delegate
{
    //将API放入字符串中
    NSString* urlStr = urlstring;//@"https://api.weibo.com/oauth2/authorize?client_id=3145625561&redirect_uri=http://www.baidu.com&display=mobile";
    
    //将字符串转化为URL
    NSURL* url = [NSURL URLWithString:urlStr];
    
    //创建请求对象
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    [self.oauthWebView loadRequest:request];
}


- (void)goBack:(id)sender
{
    [[[[[UIApplication sharedApplication] delegate] window] rootViewController] dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
