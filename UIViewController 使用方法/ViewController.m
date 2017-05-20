//
//  ViewController.m
//  UIViewController 使用方法
//
//  Created by 张智 on 16/6/13.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"
#import "ViewC02.h"
@interface ViewController ()

@end

@implementation ViewController

//当视图控制器第一次被加载时调用此函数，用于布局和初始化视图，只加载一次
- (void)viewDidLoad
{
    //调用父视图函数
    [super viewDidLoad];
    
    UIView* myView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 200)];
    [self.view addSubview:myView1];
    self.view.backgroundColor = [UIColor redColor];
    myView1.backgroundColor = [UIColor greenColor];
}

//当系统内存过低时调用这个函数，在这里可以做一些内存管理的操作
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    NSLog(@"内存过低！");
}






/////////////////////////////// 更多ViewController相关函数 ////////////////

//当viewController即将显示时调用（还没有显示）,":"后是参数，是否显示动画
-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

//当viewController显示完成（已经显示）
//与viewDidLoad的区别是viewDidLoad程序开始调一次，且只调一次
//viewDidAppear每次打开视图都会调用
-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
}

//当viewController即将关闭（还在显示）
-(void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
}

//当viewController已经关闭（不再显示）
-(void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
}

//点击屏幕时发生,viewController的函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //创建第二个视图控制器
    ViewC02* vc = [[ViewC02 alloc]init];
    
    //显示一个新的视图控制器到屏幕
    //p1 要显示的对象
    //p2 是否动画
    //p3 传一个Block块，当调用完成后调这个Block
    [self presentViewController:vc animated:YES completion:nil];
}

-(void) viewWillLayoutSubviews{}
/*
 iOS autolayout机制相关方法
 
 layoutSubviews对subviews重新布局
 
 - (CGSize)sizeThatFits:(CGSize)size
 - (void)sizeToFit
 ——————-
 
 - (void)layoutSubviews
 - (void)layoutIfNeeded
 - (void)setNeedsLayout
 ——————–
 
 - (void)setNeedsDisplay
 - (void)drawRect
 layoutSubviews在以下情况下会被调用：
 
 1、init初始化不会触发layoutSubviews
 
 但是是用initWithFrame 进行初始化时，当rect的值不为CGRectZero时,也会触发
 
 2、addSubview会触发layoutSubviews
 
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 
 4、滚动一个UIScrollView会触发layoutSubviews
 
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 */
















@end
