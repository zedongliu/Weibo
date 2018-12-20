//
//  LoginViewController.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//
#import "LoginViewController.h"
#import "MBProgressHUD.h"
#import "RootViewController.h"
#import "LoginView.h"

@interface LoginViewController ()<UIWebViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initUI{
//    LoginView *loginView = [[LoginView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
//    [self.view addSubview:loginView];
//
//    [loginView.loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // 展示登陆的网页 -> UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    // 加载网页
    
    // 一个完整的URL:基本URL + 参数
    // https://api.weibo.com/oauth2/authorize?client_id=&redirect_uri=
    
    NSString *baseUrl =        @"https://api.weibo.com/oauth2/authorize";
    NSString *client_id =      @"3051454031";
    NSString *redirect_uri =   @"http://www.baidu.com";
    
    // 拼接URL字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",baseUrl,client_id,redirect_uri];
    
    // 创建URL
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 加载请求
    [webView loadRequest:request];
    
    // 设置代理
    webView.delegate = self;
    
}


#pragma mark - Action
-(void)loginClick:(UIButton*)sender{
//    [self pushToVC:@"RootViewController" withConstruction:^(__kindof BaseViewController * _Nonnull vc) {
//    }];
    
    RootViewController *navi = [[RootViewController alloc]init];
    K_MAIN_WINDOWS.rootViewController = navi;
}



#pragma mark -UIWebView代理
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // 提示用户正在加载...
//    [MBProgressHUD showMessage:@"正在加载..."];
}

// webview加载完成的时候调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
//    [MBProgressHUD hideHUD];
}

//  webview加载失败的时候调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    [MBProgressHUD hideHUD];
}

// 拦截webView请求
// 当Webview需要加载一个请求的时候，就会调用这个方法，询问下是否请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    
    // 获取code(RequestToken)
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) { // 有code=
        
        // code=81524df3190ea6e58e33c9a0eba1ac56
        // 0 + length
        
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        // 换取accessToken
        NSLog(@"code:%@",code);
        [UserDefault setString:code forKey:@"codeToken"];
//        [self accessTokenWithCode:code];
        
        //去首页
        RootViewController *navi = [[RootViewController alloc]init];
        K_MAIN_WINDOWS.rootViewController = navi;
        
        // 不会去加载回调界面
        return YES;
        
    }
    
    return YES;
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
