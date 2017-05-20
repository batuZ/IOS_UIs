//
//  ViewController.m
//  UIScrollView 滚动视图
//
//  Created by 张智 on 16/6/25.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//横向滚动案例
-(void)setIMG{
    
    for (int i = 0; i < 12 ; i++) {
        NSString* str = [NSString stringWithFormat:@"PH7A68%d.jpg",i+1];
        UIImage* img = [UIImage imageNamed:str];
        
        //旋转图像
        img =  [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
      
        UIImageView* imgView = [[UIImageView alloc]initWithImage:img];
        
        imgView.frame = CGRectMake(320 * i, 0, 320, 480);
        UIScrollView* temp = [self.view viewWithTag:10001];
        [temp addSubview:imgView];
    }
}
-(void) testA{
    //创建一个滚动视图 ， 这是一个view
    UIScrollView* myscroll = [[UIScrollView alloc]init];
    
    //获取屏幕尺寸
    CGRect arect =[UIScreen mainScreen].bounds ;
    NSLog(@"kuan =%f , gao =%f ",arect.size.width,arect.size.height);
    
    //位置和大小
    myscroll.frame = CGRectMake(0, 0, arect.size.width, arect.size.height);
    
    //是否整页滚动,YES会自动移动到整图的位置，ＮＯ则可以让图像停在半屏位置
    myscroll.pagingEnabled = YES;
    
    //是否开启滚动效果，ＮＯ就不能动了
    myscroll.scrollEnabled = YES;
    
    //设置全部图像（内容）的整体尺寸 画布大小
    myscroll.contentSize = CGSizeMake(arect.size.width * 12, arect.size.height);
    
    //是否开启边缘弹动
    myscroll.bounces = YES;
    
    //是否开启边缘弹动 横纵约束
    myscroll.alwaysBounceVertical = NO;
    myscroll.alwaysBounceHorizontal = YES;
    
    //是否显视滚动条 横纵约束
    myscroll.showsVerticalScrollIndicator = YES;
    myscroll.showsHorizontalScrollIndicator = NO;
    
    //背景色
    myscroll.backgroundColor = [UIColor orangeColor];
    myscroll.tag = 10001;
    
    
    //加入到父视图
    [self.view addSubview:myscroll];
    
    //调用设置图像方法
    [self setIMG];
}

//纵向滚动案例
-(void)testB{

    UIScrollView* myScr = [[UIScrollView alloc]init];
    myScr.frame = CGRectMake(0, 0, 320, 480);
    myScr.contentSize = CGSizeMake(320, 480 *12);
    myScr.bounces = YES;
    myScr.tag = 10002;
    for(int i =0 ;i<12;i++)
    {
        NSString* str =[NSString stringWithFormat:@"PH7A68%d.jpg",i+1];
        UIImage* img = [UIImage imageNamed:str];
        UIImage *changeImage = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
        img = changeImage;
        UIImageView* imgView = [[UIImageView alloc]initWithImage:img];
        imgView.frame = CGRectMake(0, 480*i, 320, 480);
        [myScr addSubview:imgView];
    }
    [self.view addSubview:myScr];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //横向滚动案例
    //[self testA];
   
    //纵向滚动案例
    [self testB];

    //滚动视图的协议函数
            //指定要使用协议的对象
            UIScrollView* fodelgat = [self.view viewWithTag:10002];
            fodelgat.delegate = self;
    
}



//当滚动视图发生滚动时触发
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{}
//当滚动视图即将开始拖动时触发
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{}

//当滚动视图即将结束拖动时触发
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{}
//当滚动视图结束拖动时触发
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{}

//当滚动视图到顶时触发
-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{}

//当视图动作即将减速时触发
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{}
//当视图动作已经结束减速时触发（停止的瞬间）
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{}

//视图缩放时触发（缩放过程中）
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{}
//视图即将缩放时触发
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{}
//视图完成缩放时触发
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{}

//视图完成滚动动画时触发
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
