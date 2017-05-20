//
//  ViewController.m
//  Timer 计时器
//
//  Created by 张智 on 16/6/18.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//同步私有变量和公有属性的值
@synthesize myTim = _myyTime ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSTimer* myTime = [[NSTimer alloc] init];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(30, 400, 80, 40);
    [but setTitle:@"启动" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(qidong) forControlEvents:UIControlEventTouchDown];
    but.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame = CGRectMake(150, 400, 80, 40);
    [but1 setTitle:@"停止" forState:UIControlStateNormal];
    
    [but1 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchDown];
    but1.backgroundColor = [UIColor redColor];
    [self.view addSubview:but1];
    
    //创建一个对象，用于被timer影响
    UIView* myView = [[UIView alloc]init];
    myView.frame = CGRectMake(30, 30, 50, 50);
    myView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:myView];
    //为了能从外部访问到这个对象，
    //要设置myView的tag值,这样就可以通过父级对象和tag来找到myView
    //这个方法很爽啊
    myView.tag = 10001;
    
}

//当按下启动ＢＵＴ
-(void) qidong
{
    //NSTimer 类方法，返回值为一个新建好的定时器对象
    //scheduledTimerWithTimeInterval :每隔多长时间触发一次
    //target:<#(nonnull id)#> ：指定实现这个Timer的对象是哪位
    //selector:<#(nonnull SEL)#> ：指定Timer对象是哪位
    //userInfo:<#(nullable id)#> ：参数（无参传nil）,ID类型，可以传任何对象
    //repeats:<#(BOOL)#> : YES 每次达到间隔都触发，NO 只触发一次
    
    _myyTime =
    [NSTimer scheduledTimerWithTimeInterval:0.3
                                     target:self
                                   selector:@selector(updateTimer:)
                                   userInfo:@"sss"
                                    repeats:YES];
}
//响应Timer触发的事件
-(void)updateTimer:(NSTimer*) aT
{
    printf(".");
    
    //通过传参获取调用此函数的对象
    NSLog(@"%@:",aT.userInfo);
    
    //通过tag访问myView
    UIView* temp = [self.view viewWithTag:10001];
    //操作myView
    temp.frame = CGRectMake(temp.frame.origin.x+5,
                            temp.frame.origin.y+5,
                            temp.frame.size.height,
                            temp.frame.size.width);
}

//当按下停止ＢＵＴ，需要知道停止哪个Timer,使用Timer的返回值
-(void) stop
{
    if(_myyTime!=nil)
    {
        [_myyTime invalidate];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
