//
//  ViewController.m
//  UISwitch 开关控件
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//在实现文件中同步ViewController的mySwitch属性与成员变量_mySwitch
@synthesize mySwitch = _mySwitch;



- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个开关 对象
    _mySwitch = [[UISwitch alloc]init];
    
    //设置位置，此控件size是不可改变的设置不会影响其状态
    _mySwitch.frame = CGRectMake(100, 100, 1, 1) ;
    
            //开关的状态设置,yes 开启，no 关闭
            
            //on 是switch的属性，可以用点语法设置
            _mySwitch.on = YES;
            
            //也可以用set函数设置，但多一个是否开启动画的可先参数
            [_mySwitch setOn:YES  animated:YES];
    
    //颜色相关的设置
        //关闭时的边框颜色
        [_mySwitch setTintColor:[UIColor orangeColor]];
    
        //按钮的颜色
        [_mySwitch setThumbTintColor:[UIColor cyanColor]];
    
        //开启时的内部颜色
        [_mySwitch setOnTintColor:[UIColor orangeColor]];
    
        //背景色，默认为和父对象的背景色一致
        [_mySwitch setBackgroundColor:[UIColor whiteColor]];
    
    //响应事件
    
    [_mySwitch
     addTarget:self             //指定要触发的事件是在谁那实现的
     action:@selector(sss:)      //指定事件函数 需要实现这个事件
     forControlEvents:UIControlEventValueChanged]; //当开关控制被怎么着时 才会触发上面的事件
    
    [self.view addSubview:_mySwitch];
}

-(void)sss:(UISwitch*) mySW
{
    if(mySW.on==YES)
        NSLog(@"开关被打开");
    else
        NSLog(@"开关被关闭");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
