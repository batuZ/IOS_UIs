//
//  ViewController.m
//  UISlider&UIProgressView 滑动条&进度条
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//同步成员变量和属性
@synthesize mySlider = _slider;
@synthesize myProgress = _progress;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个进度条对象
        _progress = [[UIProgressView alloc]init];
        
        //设置位置和长度，高度不可调
        _progress.frame = CGRectMake(50, 100, 200, 1);
        
        //颜色
        _progress.progressTintColor = [UIColor purpleColor];
        _progress.trackTintColor = [UIColor greenColor];
    
        //风格
        _progress.progressViewStyle = UIProgressViewStyleDefault ;
        
        //进度值，范围为0〜1
        _progress.progress = 0.4;
    
        _progress.tag = 10001;
    
    
    //创建一个滑动条
        _slider = [[UISlider alloc]init];
        
        //设置位置和长度，高度不可调
            _slider.frame = CGRectMake(50, 200, 200, 1);
    
        //颜色相关设置
            //风格颜色，效果级别较低，在不设置其它颜色参数时有效
            _slider.tintColor = [UIColor redColor];
            //背景色
            _slider.backgroundColor = [UIColor greenColor];
            //按钮颜色
            _slider.thumbTintColor  = [UIColor grayColor];
            //按钮右边条的颜色
            _slider.maximumTrackTintColor   = [UIColor purpleColor];
            //按钮左边条的颜色
            _slider.minimumTrackTintColor   =[UIColor blueColor];
    
        //设置滑动条最大值和最小值，即滑动条的取值范围
            _slider.minimumValue = -10;
            _slider.maximumValue = 10;
    
        //滑动条的值
            _slider.value = 5;
    
        //添加事件响应函数
        [_slider addTarget:self action:@selector(auv:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.view addSubview:_progress];
    [self.view addSubview:_slider];
}
//响应滑动条事件
-(void) auv:(UISlider*) mySld
{
    //获取进度条参数
    UIProgressView* tempPro = [self.view viewWithTag:10001];
    //用滑动条影响进度条
    tempPro.progress = (mySld.value-mySld.minimumValue) / (mySld.maximumValue - mySld.minimumValue);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
