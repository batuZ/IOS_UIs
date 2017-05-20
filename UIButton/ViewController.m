//
//  ViewController.m
//  UIButton
//
//  Created by 张智 on 16/6/7.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

////////////////////////////  创建普通按钮  /////////////////////////
-(void)createUIButton{

    //创建一个对象
    //按钮要用类方法创建：buttonWithType 类名＋方法名
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //位置及大小
    btn.frame = CGRectMake(100, 100, 100, 40);
    
    
    //p1 : 文字内容    p2 : 按钮状态（普通）
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    // p1 : 文字内容    p2 : 按钮状态（按下）
    [btn setTitle:@"按下" forState:UIControlStateHighlighted];
    
    
    //p1 : 文字颜色    p2 : 按钮状态（普通）
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //p1 : 文字颜色    p2 : 按钮状态（按下）
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    //按钮的风格颜色 级别低于 setTitleColor
    [btn setTintColor:[UIColor whiteColor]];
    
    
    //p1 : 文字大小
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    
    
    //按钮背景色
    btn.backgroundColor = [UIColor grayColor];
    
    
    //把控件加到视图中
    [self.view addSubview:btn];
}

////////////////////////////  创建图像按钮  /////////////////////////

-(void) createIMGButton{
    //自义定类型的按钮
    UIButton* imgBut = [UIButton buttonWithType:UIButtonTypeCustom];
    
    imgBut.frame = CGRectMake(100, 200, 85, 100);
    
    UIImage* icon1 = [UIImage imageNamed:@"a.jpg"];
    UIImage* icon2 = [UIImage imageNamed:@"b.jpg"];
    
    [imgBut setImage:icon1 forState:UIControlStateNormal];
    [imgBut setImage:icon2 forState:UIControlStateHighlighted];
    
    [self.view addSubview:imgBut];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  //调用创建方法
    [self createUIButton];
    [self createIMGButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
