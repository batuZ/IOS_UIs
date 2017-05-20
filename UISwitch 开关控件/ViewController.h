//
//  ViewController.h
//  UISwitch 开关控件
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //UISwitch是一个开关的控件
    //有打开和关闭两种状态
    //在视图控制器的头文件里声明一个UISwitch成员变量 _mySwitch
    UISwitch* _mySwitch;
}
//为当前对象ViewController 定义一个UISwitch类型的属性
@property (retain,nonatomic) UISwitch* mySwitch;

@end

