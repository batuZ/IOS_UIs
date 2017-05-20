//
//  ViewController.m
//  UIGesture 手势
/*
 
    通过单点或多点触碰操作，并触发事件，调用相函数
    与touchBegin 不同，UIGesture的手势不是全屏有效的，只在父视图中有效
    一个视图可以有多个手势，一个手势只能对应一个视图，相同的操作可以定义多个手势进行分别指定
要点：
     1、 //交互事件响应开关 ，默认为ＮＯ， ＮＯ则不会响应手势事件
     _myImgView.userInteractionEnabled = YES;
 
    2、//设置手势的连续点击次数，达到此次数才会触发事件 默认为 1
    tap_1time.numberOfTapsRequired = 1;
 
    3､ //设置几个手指进行点击，满足此要求才能触发事件 默认为 1
     tap_1time.numberOfTouchesRequired = 1 ;
 
     4､ //把手势加入图像视图控制器
     [_myImgView addGestureRecognizer:tap_1time];
 
 
        了解： 动画开关
             //动画开关
             [UIView beginAnimations:nil context:nil]; //动画开始
             //变化时长
             [UIView setAnimationDuration:2];
             //设置一个状态，使对象拥有一个从当前状态到这个状态的变化过程
             [UIView commitAnimations]; //动画结束
 
 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个图像视图
    [self getImgView];
   
    //交互事件响应开关 ， ＮＯ则不会响应手势事件   默认为ＮＯ
    _myImgView.userInteractionEnabled = YES;
    
    //创建一个手势tap_1time 并定义触发时调用的函数tap_1
    UITapGestureRecognizer* tap_1time = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_1:)];
    
    //设置手势的连续点击次数，达到此次数才会触发事件 默认为 1
    tap_1time.numberOfTapsRequired = 1;
    
    //设置几个手指进行点击，满足此要求才能触发事件 默认为 1
    tap_1time.numberOfTouchesRequired = 1 ;
    
    //把手势加入图像视图控制器
    [_myImgView addGestureRecognizer:tap_1time];
    
    
    //创建一个手势tap_2time 并定义触发时调用的函数tap_2
    UITapGestureRecognizer* tap_2time = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_2:)];
    
    //设置手势的连续点击次数，达到此次数才会触发事件 默认为 1
    tap_2time.numberOfTapsRequired = 2;
    
    //设置几个手指进行点击，满足此要求才能触发事件 默认为 1
    tap_2time.numberOfTouchesRequired = 1 ;
    
    //把手势加入图像视图控制器
    [_myImgView addGestureRecognizer:tap_2time];
    
    //当双击时，使同时被触发的单击失效
    [tap_1time requireGestureRecognizerToFail:tap_2time];

}
//双击手势所触发的事件
-(void)tap_2:(UITapGestureRecognizer*) tap{

    [UIView beginAnimations:nil context:nil]; //动画开始
    [UIView setAnimationDuration:2];
    _myImgView.frame = CGRectMake(80, 100, 160, 240);
    [UIView commitAnimations]; //动画结束
    NSLog(@"单指双击");
}
//单击手势所触发的事件
-(void)tap_1:(UITapGestureRecognizer*) tap {

    //动画开关
    [UIView beginAnimations:nil context:nil]; //动画开始
    //变化时长
    [UIView setAnimationDuration:2];
    _myImgView.frame = CGRectMake(0, 0, 320, 480);
    [UIView commitAnimations]; //动画结束
    NSLog(@"单指单击");
}

//创建并定义一个图像视图，用于实现案例中的方法
-(void) getImgView{
    UIImage* img = [UIImage imageNamed:@"PH7A6905.JPG"];
    img = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
    //把头文件中声明的变量实例化
    _myImgView = [[UIImageView alloc]initWithImage:img];
    _myImgView.frame = CGRectMake(80, 100, 160, 240);
    [self.view addSubview:_myImgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
