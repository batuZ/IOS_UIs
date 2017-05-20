//
//  AppDelegate.m
//  XIB_1_基本概念
/*
 

 1､界面窗口的功能说明
    属性＼控件＼模拟器
 
 2､介绍了XIB的加载方法
    定义＼加载
 
 3､同步属性及事件

 */


#import "AppDelegate.h"
#import "ViewController_root.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建一个窗口对象，并给上主屏位置及大小－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //把一个ＸＩＢ视图加载到某视图上
    
    //1､显式加载：麻烦的方法
    //创建一个视图控制器对象：vcRoot
    //Ｐ1 ： 想要加载的类名：NibName:@"ViewController_root"
    //P2:   指定这个资源所在的位置，ＡＰＰ中所有的资料都会放在一个叫MainBundle的包中
    //      bundle:[NSBundle ＭainBundle] 就是指资料ViewController_root就在主资源包中
    //      如果不指定，使用nil,程序也会直接去ＭainBundle中去找叫ViewController_root的资源
    ViewController_root* vcRoot = [[ViewController_root alloc]initWithNibName:@"ViewController_root" bundle:[NSBundle mainBundle]];
    
    //2、隐式加载：简单方法
    // init时，程序会自动去包里找 ViewController_root.xib文件
    // 要是找不到〜无法加载
    ViewController_root* vcXIB = [[ViewController_root alloc]init];
    
    
    //把根视图控制器指定给主窗口
    self.window.rootViewController = vcRoot;
    //把self的window 当作主屏并立马显视出来
    [self.window makeKeyAndVisible];
    //－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    
    
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
