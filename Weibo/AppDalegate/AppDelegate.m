//
//  AppDelegate.m
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self loadTheView];
    [self settingOfNavigation];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - methods
- (void)loadTheView{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
//    BOOL ceshiEve = [UserDefault boolOfKey:kBOOLIsCeshiEve];
    
//    if (true){//(G_SHAREINSTANCETYPE_USER.isLogin && !ceshiEve) {
//        RootViewController *navi = [[RootViewController alloc]init];
//        self.window.rootViewController = navi;
//    }else{
        BaseNavigationController *loginVC = [[BaseNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
        self.window.rootViewController = loginVC;
//    }
    
    [self.window makeKeyAndVisible];
}

/**
 全局设置导航栏
 */
- (void)settingOfNavigation
{
    if (@available(iOS 9.0, *)){
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_43495E,NSFontAttributeName:REGULARFONT(FONT_18)}];
    }
}


@end
