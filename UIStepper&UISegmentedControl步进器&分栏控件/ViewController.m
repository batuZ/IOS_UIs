//
//  ViewController.m
//  UIStepper&UISegmentedControl步进器&分栏控件
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



@synthesize myStepper = _mystep;
@synthesize mySegmentedControl = _myseg;



- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个步进器
    _mystep = [[UIStepper alloc]init];
    
    //设置位置，宽高不可修改
    _mystep.frame = CGRectMake(10, 168, 1, 1);
    
        //设置最小值
        _mystep.minimumValue = 0;
        //设置最大值
        _mystep.maximumValue = 10;
        //设置当前值
        _mystep.value = 0;
        //设置步进值
        _mystep.stepValue = 1;
        //是否重复响应事件，就是按住按钮是不是会自动增减，当ＮＯ时每次抬起手值才会变化
        _mystep.autorepeat = YES;
        //只有autorepeat为ＹＥＳ时才有效，
        //当ＹＥＳ时把增减过程显视出来，并自动加速
        //当ＮＯ时 虽然值会变化，但只有抬起手才把增减结果显视出来
        _mystep.continuous = YES;
    
    _mystep.tag = 10001;
    [_mystep addTarget:self action:@selector(bjq:) forControlEvents:UIControlEventValueChanged];
    
    
    
    //创建一个分栏控制器
    _myseg = [[UISegmentedControl alloc]init];
    
    //都可设置
    _myseg.frame = CGRectMake(10, 200, 300, 80);
    
    //添加一个分栏，p1: 分栏上显示的文字， p2：这个分栏的索引 p3：是否动画
    [_myseg insertSegmentWithTitle:@"1" atIndex:1 animated:YES];
    [_myseg insertSegmentWithTitle:@"2" atIndex:2 animated:YES];
    [_myseg insertSegmentWithTitle:@"3" atIndex:3 animated:YES];
    [_myseg insertSegmentWithTitle:@"4" atIndex:4 animated:YES];
    [_myseg insertSegmentWithTitle:@"5" atIndex:5 animated:YES];
    [_myseg insertSegmentWithTitle:@"6" atIndex:6 animated:YES];
    [_myseg insertSegmentWithTitle:@"7" atIndex:7 animated:YES];
    [_myseg insertSegmentWithTitle:@"8" atIndex:8 animated:YES];
    [_myseg insertSegmentWithTitle:@"9" atIndex:9 animated:YES];
    [_myseg insertSegmentWithTitle:@"0" atIndex:0 animated:YES];
    
    //设置初始状态被选的分栏索引
    _myseg.selectedSegmentIndex = 0;
    
    _myseg.tag = 10002;
    
    [_myseg addTarget:self action:@selector(flkzq:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:_mystep];
    [self.view addSubview:_myseg];
}


-(void)bjq:(UIStepper*) stp
{
    //获取分栏对象
    UISegmentedControl* temp = [self.view viewWithTag:10002];
    //操作分栏参数
    temp.selectedSegmentIndex = stp.value;
    NSLog(@"%f",stp.value);
}

-(void)flkzq:(UISegmentedControl*) seg
{
    UIStepper* temp = [self.view viewWithTag:10001];
    temp.frame =
    CGRectMake(seg.selectedSegmentIndex * 23 + 10,
               temp.frame.origin.y,
               temp.frame.size.height,
               temp.frame.size.width) ;
    NSLog(@"%d",seg.selectedSegmentIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
