//
//  AppDelegate.m
//  UINavigationController 导航控制器
/*
 1、 在指定根视图时创建导航控制器，且必须指定一个导航控制器的根视图
        导航栏中分别在左侧和右侧添加按钮
        导航栏中分别在左侧和右侧添加多个按钮

 
 2､  用层极的方式来管理多个视图之前的切换
        在根视图的动作触发事件中创建子视图，并把子视图赋值给导航控制器，实现视图切换
 
 
 
 
 
 
 */


#import "AppDelegate.h"
#import "VCRoot.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    VCRoot* root = [[VCRoot alloc]init];
    
    //通过根视图，创建一个导航控制器, 相当于在原来指定根视图上多出的一步
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:root];
    
    //原来这里是直接指定root的，现在把nav当做视图指定给根视图控制器
    self.window.rootViewController = nav;
    
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
