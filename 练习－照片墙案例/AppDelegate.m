//
//  AppDelegate.m
//  练习－照片墙案例
/*
 1、创建两个视图控制器（VCRoot/VCphotos）和一个导航控制器(UINavigationController)框架
 
 2､ 在根视图中创建一个滚动视图(UIScrollView)
 
 3、在滚动视图中加载照片缩略图，并指定手势事件
 
 4、在照片视图控制器（VCphotos）中定义三个成员变量，用于传值
        图像对象 tag
        图像对象 NSImage
        图像视图控制器 NSImageView : 不可以当作值来传递，在一个环境中图像视图对象是唯一的！
 
 
 
 重点在根视图 响应点击事件函图里的给子视图传值
            排列图像视图的 方法
 
 
 */


#import "AppDelegate.h"
#import "VCRoot.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //创建一个导航控制器框架
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //new 一个视图对象
    VCRoot* root = [[VCRoot alloc]init];
        //new 一个导航控制器，并把上面的视图对象指定给导航控制器的根（首页）
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:root];
        //把导航控制器作为框架的根
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
