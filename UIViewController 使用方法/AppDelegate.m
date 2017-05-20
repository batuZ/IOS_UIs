//
//  AppDelegate.m
//  UIViewController 使用方法
//
//  Created by 张智 on 16/6/13.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // 这段代码是程序初始化过程，5.0版本以前需要手动创建，现在程序自动完成，需要了解过程
    
    // 1 创建一个window , 这个window是AppDelegate的属性，尺寸使用屏幕硬件尺寸
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2 创建视图控制器对象
    ViewController* vcRoot = [[ViewController alloc]init];
    
    // 3 对window的view进行赋值操作
    //   整个UIKit框架中只有一个rootViewController ,它是window的属性
    //   rootViewController 来管理界面和处理界面逻辑类对象
    //   程序启动前必须给rootViewController定义一个ViewController
    self.window.rootViewController = vcRoot;
    
    //使window生效并显示
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
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
