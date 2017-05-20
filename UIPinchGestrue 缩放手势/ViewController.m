//
//  ViewController.m
//  UIPinchGestrue 缩放手势
/*
        Pinch 捏合手势
        Rotation 旋转手势
        
        按alt 摸拟两个手指
 
        指定协意
         _myPinch.delegate = self;
         _myRota.delegate = self;
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getImgView];
    
    
    //创建一个捏合手势 ， 并定义其触发的函数 pinchact
    _myPinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchact:)];
    //将手势加入视图
    [_myImgView addGestureRecognizer:_myPinch];
    
    
    
    //创建一个旋转手势 ， 并定义其触发的函数
    _myRota = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotaAct:)];
    //将手势加入视图
    [_myImgView addGestureRecognizer:_myRota];
    
    //设置手势代理
    _myPinch.delegate = self;
    _myRota.delegate = self;
    
}

//实现捏合动作所触发的事件
- (void)pinchact:(UIPinchGestureRecognizer*) pinch
{
    //transform 变换参数
    //CGAffineTransformScale 缩放变换
    //Ｐ1 原变换参数
    //Ｐ2 Ｘ方向缩放比
    //Ｐ3 Ｙ方向缩放比
    //返回一个新的transform
    _myImgView.transform = CGAffineTransformScale(_myImgView.transform, pinch.scale, pinch.scale);
    
    //将缩放值 归位为单位值，不然缩放值会累积
    pinch.scale = 1;
}

//实现旋转动作所触发的事件
- (void)rotaAct:(UIRotationGestureRecognizer*) rota
{
    //transform 变换参数
    //CGAffineTransformRotate 旋转变换
    //Ｐ1 原变换参数
    _myImgView.transform = CGAffineTransformRotate(_myImgView.transform, rota.rotation);
    
    //将旋转值 归位为单位值，不然缩放值会累积
    rota.rotation = 0;
   
}

//<UIGestureRecognizerDelegate>协意中的方法
//是否可以同时响应两个手势
// YES 可以 ＮＯ 不可以
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

//创建并定义一个图像视图，用于实现案例中的方法
- (void) getImgView{
    UIImage* img = [UIImage imageNamed:@"PH7A6841.JPG"];
    img = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
    //把头文件中声明的变量实例化
    _myImgView = [[UIImageView alloc]initWithImage:img];
    _myImgView.frame = CGRectMake(80, 100, 160, 240);
    
    //交互事件响应开关 ， ＮＯ则不会响应手势事件   默认为ＮＯ
    _myImgView.userInteractionEnabled = YES;
    [self.view addSubview:_myImgView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
