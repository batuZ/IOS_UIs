//
//  ViewController.h
//  Timer 计时器
//
//  Created by 张智 on 16/6/18.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    //定义一个私有timer  变量
    //可以每隔一个时间段触发一个事件
    NSTimer *_myyTime;
    //这部份内容在定义time对象时也会自动生成，变量名为 "_对象名"
    // _mytim
}

//为ViewController定义一个Timer 对象 公有
@property (retain,nonatomic) NSTimer* myTim;

@end

