//
//  ViewController.m
//  手动布局与自动布局视图
/*
    
 
 1\ create a view is fatherView
 2\ import fatherview
 
 
 
 3\      “当前” 视图发生变化时触发此函数
         用于对子视图的位置大小进行重新布局
             -(void) layoutSubviews
             {
                 NSLog(@"333333");
             }
 */


#import "ViewController.h"
#import "fatherView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //create father
    fatherView* father = [[fatherView alloc]init];
    father.backgroundColor = [UIColor blueColor];
    father.frame = CGRectMake(60, 80, 100, 150);
    [self.view addSubview:father];
    father.tag = 10001;
    
    //creata a button for this test
    UIButton* but1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame = CGRectMake(1, 15, 50, 20);
    [but1 setTitle:@"放大" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(eee:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:but1];
    
    //create secend button for this test
    UIButton* but2 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but2.frame = CGRectMake(70, 15, 50, 20);
    [but2 setTitle:@"缩小" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(www:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:but2];
    
    //调用创建子视图的函数
    [father createSun];
    
    
}


//放大father
-(void)eee:but1
{
    UIView* temp = [self.view viewWithTag:10001];
        //设置动画
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
    temp.frame = CGRectMake(
                            temp.frame.origin.x,
                            temp.frame.origin.y,//这里加了一个变化
                            temp.frame.size.height,//把原来的height赋值给width
                            temp.frame.size.width+20//把原来的width＋20赋值给height
                            );
        [UIView commitAnimations];
}

//缩小father
-(void)www:but2
{
    UIView* temp = [self.view viewWithTag:10001];
        //设置动画
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
    temp.frame = CGRectMake(
                            temp.frame.origin.x,
                            temp.frame.origin.y,
                            temp.frame.size.height,
                            temp.frame.size.width-20
                            );
        [UIView commitAnimations];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
