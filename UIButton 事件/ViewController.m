//
//  ViewController.m
//  UIButton 事件
//
//  Created by 张智 on 16/6/7.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)createBut{

    //new a button
    UIButton* but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //button location
    but.frame = CGRectMake(100, 100, 180, 40);
    //button text&ts
    [but setTitle:@"牛逼哄哄的大按钮" forState:UIControlStateNormal];
    
    //触发事件  P1: tick是谁的就指谁，一般是谁的按钮谁实现，self就是自己，也可以放在AppDelegate
    //         p2: @selector(tick) 当满足p3条件时，触发 tick 事件, 带参数要加 “：”
    //         p3: button 的操作条件：UpInside 在范围内抬起，TouchDown 按下 。。。
    
    //// but 触发一个有参事件（方法），并把自己当作参数传过去
    [but addTarget:self action:@selector(tickHasCan:) forControlEvents:UIControlEventTouchUpInside];
    //// but 触发一个无参事件
    [but addTarget:self action:@selector(tick) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:but];
    
    UIButton* but1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame = CGRectMake(100, 200, 180, 40);
    [but1 setTitle:@"金光闪闪的大按钮" forState:UIControlStateNormal];
    //// but1 触发一个有参事件（方法），并把自己当作参数传过去
    [but1 addTarget:self action:@selector(tickHasCan:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but1];
    
    //按钮的标识符 tag 身份证号
    but.tag = 100001;
    but1.tag =100002;
    
}
//无参的事件
-(void)tick{

    NSLog(@"tick~tick~tick~~~~~");
}
//带参的事件
-(void)tickHasCan:(UIButton*) abtn{

    ////调文字
    NSLog(@"%@:tick~HASCAN~~~~",abtn.titleLabel.text );
    
    ////调用 tag
    if(abtn.tag==100001){
        NSLog(@"牛逼哄哄");
    }
    if (abtn.tag==100002) {
        NSLog(@"金光闪闪");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createBut];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
