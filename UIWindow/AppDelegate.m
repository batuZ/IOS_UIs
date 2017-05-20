//
//  AppDelegate.m
//  UIWindow
//
//  Created by 张智 on 16/6/13.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//当程序框架初始化成功后调用 application
//是程序对于ＩＯＳ开发者的入口
//下面是手工创建初始化过程演示，用于了解过程
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建一个window ========================== 1
    //每个程序只有一个window对象，它也可以通过子对象的属性访问
    self.window = [[UIWindow alloc] init];
    
    
    //定义window的大小
    //UIScreen 是一个硬件的类，它是一个硬件！
    //mainScreen 是主屏的设备信息,bounds是宽高信息
    self.window.frame = [UIScreen mainScreen].bounds ;
    
    
    //加入根视图控制器 ========================== 2
    self.window.rootViewController = [[UIViewController alloc]init];
    self.window.backgroundColor = [UIColor redColor ];
    
    //----------------- 在以上基础上可以添加子视图 -------------
    
    UIView* fatherView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 300)];
    fatherView.backgroundColor =[UIColor blueColor];
    
    UIView* sunView  = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 80, 280)];
    sunView.backgroundColor = [UIColor orangeColor];
    
    //爷视图window 添加了一个子视图，叫fatherView
    [self.window addSubview:fatherView];
    
    //爹视图fatherView 添加了一个子视图，叫sunView
    [fatherView addSubview:sunView];
    
    //-----------------------------------------------------
    
    //使window生效并显视在屏幕硬件上 ========================== 3
    
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
