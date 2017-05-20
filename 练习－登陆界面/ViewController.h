//
//  ViewController.h
//  练习－登陆界面
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
    //用户名：输入框
@property (retain,nonatomic) UILabel* mylabName;
@property (retain,nonatomic) UITextField* mytfName;
    //密码：输入框
@property (retain,nonatomic) UILabel* mylabPass;
@property (retain,nonatomic) UITextField* mytfPass;
    //登陆按钮
@property (retain,nonatomic) UIButton* mybutlogin;
    //注册按钮
@property (retain,nonatomic) UIButton* mybutNew;

@end

