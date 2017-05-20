//
//  AppDelegate.m
//  UITabBarController 分栏（类）控制器
/*
 
 1、分栏控制器的性质和导航控制器类似，也在是设置根视图时进行加载
    区别是，导航控制器是用来管理层级关系视图的，而分栏控制器是用来管理同级别或无层级关系的视图的
 
 2、分栏控制器的成员是用数组管理的
    在同一界面中最多显示5个成员按钮，超过5个时会自动创建一个导航控制器来管理其余成成员
 
 3、成员图标样式可以在 AppDelegate.m 中设置，但建议在成员内设置
    在成员内可以设置更多的内容
 
 4、分栏控制器的代理 UITabBarControllerDelegate 
 
 5､ 分栏的代理 UITabBarDelegate
 
 
 
 */


#import "AppDelegate.h"
#import "vc01.h"
#import "vc02.h"
#import "vc03.h"
#import "vc04.h"
#import "vc05.h"
#import "vc06.h"
#import "vc07.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //定义一个使用系统图标的视图成员
    vc01* view01 = [[vc01 alloc]init];
        
    //定义一个不使用图标的视图成员
    vc02* view02 = [[vc02 alloc]init];
        //此变量与成员中的 .backgroundColor .title 是同一变量，在这里设置会改变成员内容
        view02.view.backgroundColor = [UIColor yellowColor];
        view02.title = @"视图2";
    
    //定义一个使用自定义图标的视图成员
    vc03* view03 = [[vc03 alloc]init];
    view03.view.backgroundColor = [UIColor greenColor];

    //问题：只在指定视图中设置，根视图中创建但不设置任何内容，加载时会不显视内容
    vc04* view04 = [[vc04 alloc]init];

    //只在创建时设置内容
    vc05* view05 = [[vc05 alloc]init];
    view05.view.backgroundColor = [UIColor blueColor];
    view05.title = @"视图5";
    vc06* view06 = [[vc06 alloc]init];
    view06.view.backgroundColor = [UIColor purpleColor];
    view06.title = @"视图6";
    vc07* view07 = [[vc07 alloc]init];
    view07.view.backgroundColor = [UIColor whiteColor];
    view07.title = @"视图7";
    
    //把视图加载到数组中
    NSArray* arr = [[NSArray alloc]initWithObjects:view01,view02,view03, view04,view05,view06,view07,nil];
    
    //创建分栏控制器
    UITabBarController* tabBar = [[UITabBarController alloc]init];
    //把视图数组赋值给 分栏控制器的 viewController‘Ｓ’
    tabBar.viewControllers = arr;
    
    //把分栏控制器作为根视图加载到根视图控制器上
    self.window.rootViewController = tabBar;
    
//分栏控制器的一些功能设置-------------------------------------->
    
    //设置分栏是否透明 ， 可以参考导航控制器
    tabBar.tabBar.translucent = NO;
    
    // 设置 分栏中选中对象的索引，使索引为 2 的成员改变为选中状态
    tabBar.selectedIndex = 1;
    
    // 设置 分栏中选中对象，使 “view01” 改变为选中状态
    tabBar.selectedViewController = view01;
    
            //通过以上属性可以进行判断
            if(tabBar.selectedViewController == view01)
            {
                NSLog(@"视图1被选中");
            }else if(tabBar.selectedViewController == view02)
            {
                NSLog(@"视图2被选中");
            }else if(tabBar.selectedViewController == view03)
            {
                NSLog(@"视图3被选中");
            }
    
    //设置分栏按钮颜色
    tabBar.tabBar.tintColor = [UIColor redColor];
    
    //设置分栏底色
    tabBar.tabBar.barTintColor = [UIColor whiteColor];
    
    //.....


    
    //使用代理必须先让 对象 指定 代理调用者-------------------------------------->
    tabBar.delegate = self ;
    
    
    return YES;
}

//分栏控制器的代理 UITabBarControllerDelegate-------------------------------------->

//当选中一个分栏成员时触发，传入选中的成员
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"已经选中视图 %@",viewController.title);
}

//当 及将开始 分栏编辑时触发
-(void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
{
    NSLog(@"分栏控制器 及将开始 编辑操作！");
}

//当 完成 分栏编辑时触发，传入成员是否被编辑，未编辑为ＮＯ 已编辑为ＹＥＳ
-(void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed
{
    if(changed)
    {
        NSLog(@"编辑分栏控制器 已经结束！成员 已被 编辑！");
    }
    else{
        NSLog(@"编辑分栏控制器 已经结束！成员 未被 编辑！");
    }
}

//当 及将完成 分栏编辑时触发，传入成员是否被编辑，未编辑为ＮＯ 已编辑为ＹＥＳ
-(void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed
{
    if(changed)
    {
        NSLog(@"编辑分栏控制器 及将结束！成员 已被 编辑！");
    }
    else{
        NSLog(@"编辑分栏控制器 及将结束！成员 未被 编辑！");
    }
}

// 分栏控制器是否可以进行视图切换操作， NO 则不能进行切换操作
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}




//--------------------------------------> 割 <--------------------------------------

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
