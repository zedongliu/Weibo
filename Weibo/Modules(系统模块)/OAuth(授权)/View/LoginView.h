//
//  LoginView.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : BaseView

@property (nonatomic ,strong) UITextField *account;
@property (nonatomic ,strong) UITextField *password;
@property (nonatomic ,strong) UIButton *loginBtn;

@end

NS_ASSUME_NONNULL_END
