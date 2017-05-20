//
//  ViewController.m
//  UIAlertView & UIActivityIndicatorView 警告&等待
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton* but1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame = CGRectMake(50, 300, 100, 40);
    [but1 setTitle:@"触发警告" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(but1Go:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:but1];
    
    UIButton* but2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but2.frame = CGRectMake(150, 300, 100, 40);
    [but2 setTitle:@"触发等待" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(but2Go:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
}


//实现but1的事件
-(void)but1Go:(UIButton*) bt1
{
    NSLog(@"%@",bt1.titleLabel.text);
    
    //创建一个警告
    _myAlert = [[UIAlertView alloc]initWithTitle:@"警告！警告！"
                                         message:@"这有活人！"
                                        delegate:self //设置代理
                               cancelButtonTitle:@"cancel取消"
                               otherButtonTitles:@"butA",@"butB",@"butC",@"确定",nil];
    //[UIAlertView alloc]initWithTitle:<#(nullable NSString *)#> 对话框标题
    //                         message:<#(nullable NSString *)#> 警告内容
    //                        delegate:<#(nullable id)#>         设置代理函数,需要实现
    //                                                        UIAlertViewDelegate
    //               cancelButtonTitle:<#(nullable NSString *)#> 取消按钮的文字内容
    //               otherButtonTitles:<#(nullable NSString *), ...#>, 添加其它按钮，可添多个
    //                                 nil];                  结束添加
    
    
    //弹出警告
    [_myAlert show];
}

            ////////////// UIAlertView 的常用代理函数 ////////////////////

            //点击时传入按钮的索引值
            -(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
            {
                //第一个按钮的索引值为1,取消的索引值为0
                NSLog(@"alertView->buttonIndex = %d",buttonIndex);
                
            }
            //当对话框消失后立即调用
            -(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
            {
                NSLog(@"对话框 已经 消失,刚刚点的第%d个按钮",buttonIndex);
            }
            //对话框消失前调用
            -(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
            {
                NSLog(@"对话框 就要 消失,刚刚点的第%d个按钮",buttonIndex);
            }
            //对话框弹出后立即调用
            -(void)didPresentAlertView:(UIAlertView *)alertView
            {
                NSLog(@"%@ - 对话框已经弹出",alertView.title);
            }
            //对话框弹出前调用
            -(void)willPresentAlertView:(UIAlertView *)alertView
            {
                NSLog(@"%@ - 对话框即将弹出,内容为 － %@",alertView.title,alertView.message);
            }
            ////////////// UIAlertView 的常用代理函数 ////////////////////


//实现but2的事件
-(void)but2Go:(UIButton*) bt2
{
    if (_myActivity == nil)
    {
        NSLog(@"%@",bt2.titleLabel.text);
        
        //创建一个等待控制器
        _myActivity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(120, 200, 1, 1)];
        
        //设置样式，小灰，小白，大白
        _myActivity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge ;
        
        //把等待指示器加到视图中
        [self.view addSubview:_myActivity];
    }
    
    if (_myActivity.isAnimating == 0)
    {
        //如果当前为停止状态，则开始
        [_myActivity startAnimating];
    }
    else
    {
        //设置状态,如果当前为开始状态，则停止
        [_myActivity stopAnimating];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
