//
//  ViewController.m
//  UITextField 文本控件
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
/*
 
 特性：
    TextField 是一个文本输入区，如用户名或密码
    只能输入单行文本
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //与 _myTextf 相同，是以一对象属性
    
    // new一个对象
    self.myTextf = [[UITextField alloc]init];
    
    //位置，大小
    _myTextf.frame = CGRectMake(50, 100, 200, 30);
    
    //文字内容
    self.myTextf.text = @"ssssss";
    
    //文字大小
    _myTextf.font = [UIFont systemFontOfSize:18];
    
    //文字颜色
    self.myTextf.textColor = [UIColor redColor];
    
    //输入框风格,圆角，曲线，直线，无
    _myTextf.borderStyle = UITextBorderStyleRoundedRect;
//    _myTextf.borderStyle = UITextBorderStyleBezel;
//    _myTextf.borderStyle = UITextBorderStyleLine;
//    _myTextf.borderStyle = UITextBorderStyleNone;

    //输入键盘风格,默认，字母和数字，纯数字
//    self.myTextf.keyboardType = UIKeyboardTypeDefault;
//    self.myTextf.keyboardType = UIKeyboardTypeNamePhonePad;
//    self.myTextf.keyboardType = UIKeyboardTypeNumberPad;

    //提示信息，在无输入内容时显示
    _myTextf.placeholder = @"请输入用户名...";
    
    //密码输入，显视为圆点
    _myTextf.secureTextEntry = NO;
    
    [self.view addSubview:self.myTextf];
    
    ////   重要！ ////  必须给对象设置代理才会生效！！ /////
    _myTextf.delegate = self;
}

// 收回输入键盘的方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //取消对象的焦点状态，以达到收回输入键盘的目的
    [_myTextf resignFirstResponder];
}

/////////////////// UITextFieldDelegate /////////////////

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"已经开始编辑文本了！");
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"已经停止编辑文本了！");
    _myTextf.text = @"";
}
//是否可以开始编辑,无权限时用
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{return YES;}
//是否可以停止编辑，不足位数时
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{return YES;}
//是否可以清空
-(BOOL)textFieldShouldClear:(UITextField *)textField{return YES;}
//是否可以返回
-(BOOL)textFieldShouldReturn:(UITextField *)textField{return YES;}
//
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{return YES;}

/////////////////// UITextFieldDelegate /////////////////






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
