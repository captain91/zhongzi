//
//  AppDelegate.m
//  TianJiFirst
//
//  Created by Sun on 15/11/24.
//  Copyright © 2015年 jsb. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate{
    
    UITabBarController *tabBarControllers;
    
    UINavigationController *mineNa;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self createViewControllers];
    
    //去掉消息通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cleanBadgeValue) name:@"cleanBadgeValue" object:nil];
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)cleanBadgeValue{
    mineNa.tabBarItem.badgeValue = nil;
}
-(void)createViewControllers{
    
    PageViewController *pageVc = [PageViewController new];
    InformationViewController *inforMationVC = [[InformationViewController alloc]init];
    TradeViewController *tradVc = [[TradeViewController alloc]init];
    HoldViewController *holdVc = [[HoldViewController alloc]init];
    MineViewController *mineVc = [[MineViewController alloc]init];
    
    
    UINavigationController *informationNa = [[UINavigationController alloc]initWithRootViewController:inforMationVC];
    UINavigationController *tradNa = [[UINavigationController alloc]initWithRootViewController:tradVc];
    UINavigationController *holdNa = [[UINavigationController alloc]initWithRootViewController:holdVc];
    mineNa = [[UINavigationController alloc]initWithRootViewController:mineVc];
    
    UINavigationController *pageNa = [[UINavigationController alloc]initWithRootViewController:pageVc];
    
    [pageNa.tabBarItem setTitle:@"首页"];
    [pageNa.tabBarItem setImage:[UIImage imageNamed:@""]];
    
    [informationNa.tabBarItem setTitle:@"资讯"];
    [informationNa.tabBarItem setImage:[UIImage imageNamed:@""]];
    
    [tradNa.tabBarItem setTitle:@"收益榜"];
    [tradNa.tabBarItem setImage:[UIImage imageNamed:@""]];
    
    [holdNa.tabBarItem setTitle:@"持仓"];
    [holdNa.tabBarItem setImage:[UIImage imageNamed:@""]];
    
    [mineNa.tabBarItem setTitle:@"我的"];
    [mineNa.tabBarItem setImage:[UIImage imageNamed:@""]];
//    mineNa.tabBarItem.badgeValue = @"123";
//    mineNa.tabBarItem.badgeValue = nil;
    
    NSArray *navigationVCArray = [NSArray arrayWithObjects:pageNa,informationNa,tradNa,holdNa,mineNa,nil];
    
    
    tabBarControllers = [[UITabBarController alloc]init];
    tabBarControllers.viewControllers = navigationVCArray;
    
//    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    
    self.window.rootViewController = tabBarControllers;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
