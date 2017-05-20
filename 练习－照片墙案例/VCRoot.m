//
//  VCRoot.m
//  UIs
//
//  Created by 张智 on 16/7/28.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "VCRoot.h"
#import "VCphotos.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"相机胶卷";
    //设置导航栏是否透明
    self.navigationController.navigationBar.translucent = YES;
    //创建一个滚动视图,导航视图的子视图
    UIScrollView* scr = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //设置滚动视图的画布大小
    scr.contentSize = CGSizeMake(scr.frame.size.width , scr.frame.size.height*1.5);
    
    scr.backgroundColor = [UIColor whiteColor];
    //打开交互事件（上下滚动），非常重要，且易忘记
    scr.userInteractionEnabled = YES;
    
    //隐藏滚动条
    scr.showsVerticalScrollIndicator = NO;
    scr.showsHorizontalScrollIndicator = NO;

    //把照片加入滚动视图
    for (int i =0; i< 23 ; i++) {
        //指定图片路径
        NSString* str = [ NSString stringWithFormat:@"%d.JPG",i+1 ];
        //创建图像对象
        UIImage* img = [UIImage imageNamed:str];
        //创建图像视图
        UIImageView* imgView = [[UIImageView alloc]initWithImage:img];
        imgView.frame = CGRectMake((i%4)*80, 5+(i/4)*53, 79, 52);
        //开启图像控制器的动作事件交互
        imgView.userInteractionEnabled = YES;
        imgView.contentMode = UIViewContentModeScaleToFill;
        
        //把图像视图加入到滚动视图中
        [scr addSubview:imgView];
        
        
        //创建点击手势
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTap:)];
        //定义点击手势有效动作，为单次单击
        tap.numberOfTapsRequired = 1;
        //定义点击手势所用手指数（触碰点数），为一个手指
        tap.numberOfTouchesRequired = 1;
        
        
        //把手势加入当前图像视图
        [imgView addGestureRecognizer:tap];
    }
    
    [self.view addSubview:scr];

    // Do any additional setup after loading the view.
}


-(void) pressTap:(UITapGestureRecognizer*)tapp
{
    //创建一个照片视图对像
    VCphotos* aPhotoView = [[VCphotos alloc]init];
    
    //把传入参数中的view属性赋给照片视图的图像属性，需要仔细理解
    
    //在这里把值传给子视图 ， 指定aPhotoView.img 成员变量的值，也可以用tag传入图像的索引
    aPhotoView.img = ((UIImageView*) tapp.view).image;
    //UIImageView* loaclimg = (UIImageView*) tapp.view;

    //推出子视图，带动画
    [self.navigationController pushViewController:aPhotoView animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
