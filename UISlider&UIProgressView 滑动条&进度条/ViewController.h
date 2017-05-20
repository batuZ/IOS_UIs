//
//  ViewController.h
//  UISlider&UIProgressView 滑动条&进度条
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //声明成员变量
    
        //进度条 下载进度 被动
        UIProgressView* _progress;
        
        //滑动条 调整音量 主动
        UISlider* _slider;
}

//声明ViewController的属性
    @property (retain,nonatomic) UIProgressView* myProgress;
    @property (retain,nonatomic) UISlider* mySlider;

@end

