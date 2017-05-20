//
//  ViewController.m
//  练习－登陆界面
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
    
    _mylabName = [[UILabel alloc]initWithFrame:CGRectMake(40, 160, 100, 30)];
    _mylabName.text = @"用户名：";
    _mylabName.font = [UIFont systemFontOfSize:12];
    
    _mytfName = [[UITextField alloc]initWithFrame:CGRectMake(100, 164, 170, 24)];
    _mytfName.borderStyle = UITextBorderStyleRoundedRect;
    _mytfName.textAlignment = NSTextAlignmentLeft;
    _mytfName.placeholder = @"请输入用户名...";
    _mytfName.delegate = self;
    
    _mylabPass = [[UILabel alloc]initWithFrame:CGRectMake(40, 200, 100, 30)];
    _mylabPass.text = @"密 码：";
    _mylabPass.font = [UIFont systemFontOfSize:12];
    
    _mytfPass = [[UITextField alloc]initWithFrame:CGRectMake(100, 204, 170, 24)];
    _mytfPass.borderStyle = UITextBorderStyleRoundedRect;
    _mytfPass.secureTextEntry = YES;
    _mytfPass.placeholder = @"请输入密码...";
    _mytfPass.delegate = self;
    
    _mybutlogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _mybutlogin.frame = CGRectMake(120, 300, 80, 30);
    [_mybutlogin setTitle:@"登陆" forState:UIControlStateNormal];
    [_mybutlogin addTarget:self action:@selector(butlogin:) forControlEvents:UIControlEventTouchDown];
    
    _mybutNew = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _mybutNew.frame = CGRectMake(120, 350, 80, 30);
    [_mybutNew setTitle:@"注册" forState:UIControlStateNormal];
    [_mybutNew addTarget:self action:@selector(butnew:) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view addSubview:_mylabName];
    [self.view addSubview:_mylabPass];
    [self.view addSubview:_mytfName];
    [self.view addSubview:_mytfPass];
    [self.view addSubview:_mybutlogin];
    [self.view addSubview:_mybutNew];
}

-(void)butlogin:(UIButton*)butlogin
{
    NSString* strName = @"Batu";
    NSString* strPass = @"666666";
    
    NSString* inputName = _mytfName.text;
    NSString* inputPass = _mytfPass.text;
    
    if ([inputName isEqualToString:strName] && [inputPass isEqualToString:strPass]) {
        UIAlertView* aView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"登陆成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [aView show];
    }
    else
    {
        UIAlertView* aView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名或密码不正确" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [aView show];
    }
}
-(void)butnew:(UIButton*)butnew
{}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_mytfName resignFirstResponder];
    [_mytfPass resignFirstResponder];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
