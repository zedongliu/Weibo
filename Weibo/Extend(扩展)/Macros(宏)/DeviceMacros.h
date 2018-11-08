//
//  DeviceMacros.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#ifndef DeviceMacros_h
#define DeviceMacros_h

#define K_MAIN_WINDOWS ([UIApplication sharedApplication].keyWindow)//获取当前windows

#define K_CURRENT_VIEWCONTROLLER K_MAIN_WINDOWS.rootViewController.presentingViewController?:K_MAIN_WINDOWS.rootViewController//K_MAIN_WINDOWS.rootViewController//获取当前控制器 仅用于alertcontroler

#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define ApplicationShowNetworkActivityIndicator      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
#define ApplicationHideNetworkActivityIndicator      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

//是否Retina屏
#define ISIPHONE4S                  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) :NO)
//是否iPhone5
#define ISIPHONE                  [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define ISIPHONE5                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE5_OR_LESS (KScreenWidth < 350)

#define ISIPHONE6                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define ISIPHONE6PLUS                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define ISIPHONE6PLUS_NORMAL              ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define ISIPHONE6PLUS_SMALL          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) : NO)

#define ISIPHONEX          ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//是否是iPad
#define isPad                      (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//手机系统版本
#define FSystemVersion            ([[[UIDevice currentDevice] systemVersion] floatValue])
#define SystemVersionString        [[UIDevice currentDevice] systemVersion]

//应用版本号
#define AppCurrentVersion            [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
//应用程序的名字
#define AppDisplayName              [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]

//判断设备室真机还是模拟器
#if TARGET_OS_IPHONE
/** iPhone Device */
#endif

#if TARGET_IPHONE_SIMULATOR
/** iPhone Simulator */
#endif

///判断系统版本
#ifndef __IPHONE_10_0
#define __IPHONE_10_0 100000
#endif
#define IOS_VERSION_10_OR_LATER (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0)




#endif /* DeviceMacros_h */
