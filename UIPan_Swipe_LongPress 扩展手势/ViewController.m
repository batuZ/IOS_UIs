//
//  ViewController.m
//  UIPan\Swipe\LongPress 扩展手势
/*
 
 //平移手势
 UIPanGestureRecognizer* _myPan;
 
 //滑动手势 左右上下
 UISwipeGestureRecognizer* _mySwipe;
 
 //长按手势
 UILongPressGestureRecognizer* _myLongPress;
 
 
 
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getImgView];
    
    //平移手势
    _myPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAec:)];
    // 因为与滑动手势冲突，需要把平移手势注示掉
    [_myImgView addGestureRecognizer:_myPan];
    
    
    //滑动手势 左右上下
    _mySwipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAec:)];
    //滑动手势的四个状态
    _mySwipe.direction = UISwipeGestureRecognizerDirectionUp
                        |UISwipeGestureRecognizerDirectionDown
                        |UISwipeGestureRecognizerDirectionLeft
                        |UISwipeGestureRecognizerDirectionRight ;
    
    //[_myImgView addGestureRecognizer:_mySwipe];
    
    
    //长按手势
    _myLongPress =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longpressAec:)];
    [_myImgView addGestureRecognizer:_myLongPress];
    //设置长按手势的时间，默认值为0.5秒
    _myLongPress.minimumPressDuration = 1;
}

//实现平移事件--------------------------------------------------------
-(void)panAec:(UIPanGestureRecognizer*)pan
{
    
    //获取平移的相对坐标增减量
    CGPoint addValue = [pan translationInView:self.view];
    //NSLog(@"panX = %2f , panY = %2f",addValue.x,addValue.y);
    
    //获取平移速度，像素＼秒
    //CGPoint addSpeed = [pan velocityInView:self.view];
    //NSLog(@"X平移速度为：%2f , Y平移速度为：%2f",addSpeed.x,addSpeed.y);
    
    _myImgView.frame = CGRectMake(_after.x + addValue.x,
                                  _after.y + addValue.y,
                                  _myImgView.frame.size.width,
                                  _myImgView.frame.size.height);
}
//配合平移事件：在平移前，先记录当前对象位置，这个位置加平移增减量，可使对象在窗口中正常移动
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //记录 _myImgview的初始位置
    _after = CGPointMake(_myImgView.frame.origin.x, _myImgView.frame.origin.y);
}

//实现滑动事件--------------------------------------------------------
-(void)swipeAec:(UISwipeGestureRecognizer*)swipe
{

    if(swipe.direction & UISwipeGestureRecognizerDirectionUp)
    {
        NSLog(@"UP");
    }
    else if(swipe.direction & UISwipeGestureRecognizerDirectionDown)
    {
        NSLog(@"DOWN");
    }
    else if(swipe.direction & UISwipeGestureRecognizerDirectionLeft)
    {
        NSLog(@"RIGHT");
    }
    else if(swipe.direction & UISwipeGestureRecognizerDirectionRight)
    {
        NSLog(@"LEFT");
    }
}

//实现长按事件--------------------------------------------------------
//有按下、抬起和移动三个状态
-(void)longpressAec:(UILongPressGestureRecognizer*)longpress
{
    if(longpress.state == UIGestureRecognizerStateBegan)
    {
        //长按开始时触发
        NSLog(@"longPress:StateBegan");
    }
    else if(longpress.state == UIGestureRecognizerStateEnded)
    {
        //长按放开时触发
        NSLog(@"longPress:StateEnded");
    }
    else//长按并移动时触发
    {
    NSLog(@"长按并移动");
    }
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
