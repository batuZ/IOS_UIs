//
//  ViewController.m
//  UITouch 手指点击事件
//
//  Created by 张智 on 16/6/25.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建一个图像视图用于演示 ＵＩＴＯＵＣＨ
    UIImage* img = [UIImage imageNamed:@"aa.JPG"];
    img = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
    UIImageView* imgView = [[UIImageView alloc]init];
    imgView.image = img;
    imgView.frame = [UIScreen mainScreen].bounds;
    imgView.tag =10001;
    [self.view addSubview:imgView];
}
//屏幕点击的相关协议函数 （在）

//按到屏幕的瞬间触发 ---------------------- 图像缩放案例
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImageView* temp = [self.view viewWithTag:10001];
    //获取点击对象，anyObject为获取任何一个点击动作
    UITouch* touch = [touches anyObject];
    
    if(touch.tapCount == 1){
        //temp.frame = CGRectMake(50, 50, 100, 150);
        NSLog(@"单击");
    }
    else if (touch.tapCount == 2){
        
        CGRect a =[UIScreen mainScreen].bounds;
        
        if (CGRectContainsRect(temp.frame, a)) {
            temp.frame = CGRectMake(50, 50, 100, 150);
        }
        else
        {
            temp.frame = a;
        }
        
        
        NSLog(@"双击");
    }
    after = [touch locationInView:self.view];
}

//手指在屏幕上滑动时触发  ---------------------- 图像拖动案例
-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImageView* temp = [self.view viewWithTag:10001];
    UITouch* touch = [touches anyObject];
    
    //获取手指在当前视图中的相对坐标（超有用！）
    CGPoint mosLocation = [touch locationInView:self.view];
    
    //用当前移动的坐标减去第一次点击时的坐标，可以得到手指移动的 偏移量！！！
    float xoff = mosLocation.x - after.x;
    float yoff = mosLocation.y - after.y;
    after = mosLocation;
    temp.frame = CGRectMake(temp.frame.origin.x + xoff,
                            temp.frame.origin.y + yoff,
                            temp.frame.size.width,
                            temp.frame.size.height);
    
}
//手指离开屏幕时触发
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}
//紧急（意外）切出时触发
-(void) touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
