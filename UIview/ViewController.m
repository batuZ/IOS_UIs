//
//  ViewController.m
//  UIview
/*
 
 自动调整子视图的宽度和高度
 
 myView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight ;
 
 
 
 
 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ////创建一个UIView
    UIView* myView = [[UIView alloc] init];
    
    //设置位置和大小
    myView.frame = CGRectMake(100, 100, 100, 150);
    
    //设置Ｍyview的背景色
    myView.backgroundColor = [UIColor greenColor];
    myView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight ;
    
    //把MyView添加到父view中，并确认父子关系
    [self.view addSubview:myView];
    
    //设置对象是否隐藏
    myView.hidden = NO; //不隐藏
    
    //透明度，0全透，1不透
    myView.alpha = 0.5; //半透
    
    //清除对象，把自己从父对象上删除，对添加为反向操作
    [myView removeFromSuperview];
    
    
    ////设置控件显视层级关系
    
    //调整到最前 ： 目标对象
    [self.view bringSubviewToFront:myView];
    //调到最后  ：  目标对象
    [self.view sendSubviewToBack:myView];
    
    
    ////对象的子对象是放在一个叫 subviews 的数组里
    
    //self.view.subviews[0] 就是刚刚添加进去的 myView
   // UIView* aView = self.view.subviews[0] ;
    //指向当前对象的爹
   // aView.superview ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
