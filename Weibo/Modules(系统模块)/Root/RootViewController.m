//
//  RootViewController.m
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "RootViewController.h"

#import "BaseTabBar.h"

#import "WeiboRootVC.h"
#import "MessageRootVC.h"
#import "FindRootVC.h"
#import "PersonalRootVC.h"

@interface RootViewController ()

//自定义的TabBar
//@property(nonatomic,strong) BaseTabBar *tabBar;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {
    [self.view setBackgroundColor:COLOR_WHITE];
    
    [self setValue:[[BaseTabBar alloc] init] forKeyPath:@"tabBar"];
    
    // 通过appearance统一设置UITabbarItem的文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];  // 设置文字大小
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];  // 设置文字的前景色
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = COLOR_FF6600;
    
    UITabBarItem * item = [UITabBarItem appearance];  // 设置appearance
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupChildVC: [[WeiboRootVC alloc]init] withTitle:@"微博" andImage:@"tabbar_home" andSelectImage:@"tabbar_home_selected"];
    [self setupChildVC: [[MessageRootVC alloc]init] withTitle:@"消息" andImage:@"tabbar_message_center" andSelectImage:@"tabbar_message_center_selected"];
    [self setupChildVC: [[FindRootVC alloc]init] withTitle:@"发现" andImage:@"tabbar_discover" andSelectImage:@"tabbar_discover_selected"];
    [self setupChildVC: [[PersonalRootVC alloc]init] withTitle:@"我" andImage:@"tabbar_profile" andSelectImage:@"tabbar_profile_selected"];
    
  
}

/**
 * 初始化子控制器
 */
- (void)setupChildVC:(BaseViewController *)VC withTitle:(NSString * )title andImage:(NSString * )image andSelectImage:(NSString *)selectImage{
    VC.tabBarItem.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:image];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    VC.view.backgroundColor = COLOR_ECECEC;
    [self addChildViewController:VC];
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
