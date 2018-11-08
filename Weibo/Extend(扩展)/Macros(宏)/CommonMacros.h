//
//  CommonMacros.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//



#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//屏幕宽高
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

//系统高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度
#define kNavBarHeight 44.0
#define KTabBarHeight  (kStatusBarHeight>20?(83):(49))//底部的高度
#define KNaviHeight (kStatusBarHeight + kNavBarHeight)//导航栏

//屏幕的缩放
#define G_SCREEN_SCALE [UIScreen mainScreen].scale

//获取缩放高
#define SCALE_Heigth(a) (a/667.0f*KScreenHeight)


//图片
#define IMAGENAMED(NAME)       [UIImage imageNamed:NAME]
#define IMAGENAMEDORGINAL(NAME)  [[UIImage imageNamed:NAME] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
#define G_IMAGE_DEFAULT_SQUARE [UIImage imageNamed:@"icon_mine_head"]


//颜色
#ifndef RGB
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif /* CommonMacros_h */
