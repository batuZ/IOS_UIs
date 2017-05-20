//
//  AppDelegate.m
//  UINavigationController 导航控制器风格和工具栏
/*
 
 1、 设置导航控制器的风格
 
 2、 设置工具栏的风格
 
 3､  为工具栏加按钮
 
 4､ 导航栏和工具栏本身是共用的，而上面的元素是属性当前视图控制器，是私有的
        可以通过代码区分：
            self.navigationController 是导航栏的，共用的
            self.navigationItem 是导航元素项，是当前视图控制器私有的
            self.toolbarItems 是工具栏元素项，是当前视图控制器私有的
 */


#import "AppDelegate.h"
#import "VCRoot.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    
    //指定带有导航控制器的根视图
        //创建一个window,且Frame 为主屏（mainScreen）的位置信息（bounds）
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        //创建一个视图，把这个视图当作根视图（UIView）
    VCRoot* root = [[VCRoot alloc]init];
        //通过初始化根视图（initWithRootViewController）的方法来创建一个导航控制器
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:root];
        //把带有根视图的导航控制器作为根视图控制器，赋值给window的根视图控制器
    self.window.rootViewController = nav;
        //让这个window作为主屏，并显视
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
