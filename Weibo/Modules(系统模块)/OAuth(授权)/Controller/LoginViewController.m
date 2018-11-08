//
//  LoginViewController.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "LoginViewController.h"
#import "RootViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    LoginView *loginView = [[LoginView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    [self.view addSubview:loginView];
    
    [loginView.loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


#pragma mark - Action
-(void)loginClick:(UIButton*)sender{
    [self pushToVC:@"RootViewController" withConstruction:^(__kindof BaseViewController * _Nonnull vc) {
        
    }];
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
