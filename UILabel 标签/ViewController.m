//
//  ViewController.m
//  UILabel 标签
//
//  Created by 张智 on 16/6/7.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//建一个添加lable的函数
- (void)createUI{

    // new 一个 UILabel
    UILabel *lable = [[UILabel alloc]init];
    
    //文字内容
    lable.text = @"hello wrold!";
    
    //文字大小
    lable.font = [UIFont systemFontOfSize:12];
    
    //文字颜色
    lable.textColor = [UIColor grayColor];
    
    //文字对方式
    lable.textAlignment = NSTextAlignmentCenter;
    
    //文字显视行数,0为自动适配，非0为强制行数
    lable.numberOfLines = 0;
    
    //标签位置
    lable.frame = CGRectMake(100, 100, 160, 40);
    
    //标签的背景色
    lable.backgroundColor = [UIColor redColor];
    
    //屏幕背景色
    self.view.backgroundColor = [UIColor blueColor];
    
    //高级属性：阴影
    //阴影颜色
    lable.shadowColor = [UIColor grayColor];
    
    //阴影偏移量
    lable.shadowOffset = CGSizeMake(3, 3);
    
    
    
    //把控件添加到屏幕上
    [self.view addSubview:lable];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];






}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
