//
//  AppDelegate.m
//  练习－多界面传值
/*
 1、 分栏控制器中包括导航控制器 ，使用练习
 
 2、 实现用 视图2 和 视图1 改变 root 的属性
        思路：把要改变的内容，传出去给root，通过代理实现
 
 3､ 定义 代理协议 并实现 2，的要求
    定义代理流程：
        a，在当前视图控制器中定义
 
           在当前视图管理器.h文件中：
 
                 // pass1,声明代理关键词@protocol ＋ 当前类名 ＋ Delegate
             @protocol VC_1_viewDelegate <NSObject>
             
                 // pass2,声明当前类要做的 必须由代理实现的 事件
             -(void) changeBKColor:(UIColor*) color;
             @end
             
             @interface VC_1_view : UIViewController
             
                 // pass3,声明一个代理对象，泛型类型 ＋ 代理协议名 ＋ 对象名
             @property (nonatomic,assign) id <VC_1_viewDelegate> delegate;
             @end
 
          在当前视图管理器.m文件中：
 
                 // pass4,定义需要通过代理做的事，代理事件
             -(void)changeBKColor:(UIColor *)color
             {
                 [_delegate changeBKColor:color];
             }
 
          在调用这个视图管理器的视图.h中引入这个代理：
 
                 // pass5,引入调用类的头文件，代理声明都在这里
             #import "VC_1_view.h"
 
                 // pass6,引入代理协议名
             @interface VCroot : UIViewController<VC_1_viewDelegate>
             @end
 
          在调用这个视图管理器的视图VCroot.m中实现这个代理事件：
 
                 // pass7, 指定使用代理协议的 ＃对象＃
             _1view.delegate = self;
 
                // pass8, 只要在调用类中触发这个函数，及实现代理事件
             -(void)changeBKColor:(UIColor *)color
             {
                 self.view.backgroundColor = color;
             }
 
 
    b，定义单独的代理类 
        在VC_2_viewDelegate.h 中
                 // pass1,定义一个协议，VC_2_view的协议，创建VC_2_view时要实现本协议
             @protocol VC_2_viewDelegate <NSObject>
             
                 // pass2,定义一个协议函数，想要做的事
             -(void) changeColor:(UIColor*) color;
             
             @end
 
        在 VC_2_view.h 中

                // pass3,引入代理头文件
             #import "VC_2_viewDelegate.h"
                 //pass4,引入代理协议名
             @interface VC_2_view : UIViewController<VC_2_viewDelegate>
                 //pass5,声明一个代理对象，这个对象会执行协议,完成要做的事，id为泛型
             @property (nonatomic,assign) id <VC_2_viewDelegate> delegate;
             @end
 
         在 VC_2_view.m 中
 
             // pass6,定义代理事件,通过调用这个函数触发
             -(void)changeColor:(UIColor *)color
             {
                 [_delegate changeColor:color];
                 NSLog(@"调用者：请使用此颜色！");
             }
             
        在调用者  AppDelegate.h 中 
 
                // pass7引用头文件，引入代理协议名
             #import "VC_2_viewDelegate.h"
             @interface AppDelegate : UIResponder <UIApplicationDelegate,VC_2_viewDelegate>
             @end
 
         在调用者  AppDelegate.h 中
 
                // pass8,指定使用代理协议的 对象
             _2view.delegate = self;
 
                // pass9,实现代理协议事件
             -(void)changeColor:(UIColor *)color
             {
                 _root.view.backgroundColor = color  ;
             }
             
 */


#import "AppDelegate.h"
#import "VCroot.h"
#import "VC_2_view.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    //创建第一个视图，并加入到一个导航控制器中
    _root = [[VCroot alloc]init];
    _root.title = @"root";
    _root.view.backgroundColor = [UIColor whiteColor];
    
    //创建导航控制器
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:_root];
    
    
    
    //创建第二个视图，并把这个视图和导航控制器一起加入到一个分栏控制器
    VC_2_view* _2view = [[VC_2_view alloc]init];
    _2view.title = @"视图2";
    _2view.view.backgroundColor = [UIColor grayColor];
    UINavigationController* nav2 =[[UINavigationController alloc]initWithRootViewController:_2view  ];
    
    _2view.delegate = self;
    // 把以上两个视图加入到一个 数组中，当作分栏控制器的成员
    NSArray* arr = [NSArray arrayWithObjects:nav,nav2, nil];
    
    
    //创建一个分栏控制器
    UITabBarController* tabVC = [[UITabBarController alloc]init];
    
    
    //把成员指定进分栏控制器
    tabVC.viewControllers = arr;
    
    
    //指定 window 的 root 视图
    self.window.rootViewController = tabVC;
    
    
    
    return YES;
}

-(void)changeColor:(UIColor *)color
{
    _root.view.backgroundColor = color  ;
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
