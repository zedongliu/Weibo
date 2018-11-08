//
//  LoginView.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "LoginView.h"

@interface LoginView(){
    UILabel *title;
    UIView *underLine;
    UIView *underLine2;
}

@end

@implementation LoginView

- (void)initUI{
    
    [self setBackgroundColor:COLOR_WHITE];
    
    title = [[UILabel alloc]init];
    title.text = @"请输入账号密码";
    title.font = MEDIUMFONT(28);
    title.textColor = COLOR_43495E;
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(Margin24);
        make.top.equalTo(self.mas_top).mas_offset(SCALE_Heigth(100));
        make.right.equalTo(self.mas_right).mas_offset(-Margin24);
        make.height.mas_equalTo(Height45);
    }];
    
    _account = [[UITextField alloc] init];
    _account.placeholder = @"手机号或邮箱";
    _account.textColor =[UIColor blackColor];
    [_account setValue:COLOR_BFC3CF forKeyPath:@"_placeholderLabel.textColor"];
    _account.font = REGULARFONT(FONT_15);
    _account.keyboardType = UIKeyboardTypeASCIICapable;
    [self addSubview:_account];
    [_account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(Margin24);
        make.top.equalTo(self.mas_top).mas_offset(SCALE_Heigth(180));
        make.right.equalTo(self.mas_right).mas_offset(-Margin24);
        make.height.mas_equalTo(SCALE_Heigth(41));
    }];
    
    underLine = [[UIView alloc]init];
    underLine.backgroundColor =  COLOR_ECECEC;
    [self addSubview:underLine];
    [underLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(Margin24);
        make.top.equalTo(self.mas_top).mas_offset(SCALE_Heigth(220));
        make.right.equalTo(self.mas_right).mas_offset(-Margin24);
        make.height.mas_equalTo(SCALE_Heigth(1));
    }];
    
    _password = [[UITextField alloc] init];
    _password.placeholder = @"请输入登录密码";
    _password.textColor =[UIColor blackColor];
    [_password setValue:COLOR_BFC3CF forKeyPath:@"_placeholderLabel.textColor"];
    _password.font = REGULARFONT(FONT_15);
    _password.keyboardType = UIKeyboardTypeASCIICapable;
    [self addSubview:_password];
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(Margin24);
        make.top.equalTo(self.mas_top).mas_offset(SCALE_Heigth(240));
        make.right.equalTo(self.mas_right).mas_offset(-Margin24);
        make.height.mas_equalTo(SCALE_Heigth(41));
    }];
    
    underLine2 = [[UIView alloc]init];
    underLine2.backgroundColor =  COLOR_ECECEC;
    [self addSubview:underLine2];
    [underLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(Margin24);
        make.top.equalTo(self.mas_top).mas_offset(SCALE_Heigth(280));
        make.right.equalTo(self.mas_right).mas_offset(-Margin24);
        make.height.mas_equalTo(SCALE_Heigth(1));
    }];
    

    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginBtn.layer.cornerRadius = 4;
    [_loginBtn setBackgroundColor:COLOR_FF6600];
    [_loginBtn setTitleColor:COLOR_WHITE forState:UIControlStateNormal];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(Margin24);
        make.top.equalTo(self).mas_offset(SCALE_Heigth(320));
        make.right.equalTo(self.mas_right).mas_offset(-Margin24);
        make.height.mas_equalTo(SCALE_Heigth(40));
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
