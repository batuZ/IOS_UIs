//
//  VCroot.m
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "VCroot.h"
#import "VC_1_view.h"

@interface VCroot ()

@end

@implementation VCroot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    //设置一个系统图标，系统图标的样式是固定的，不能改变
    UITabBarItem* tabBut = [[UITabBarItem alloc]
                            initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1001];
    
    //设置提示信息，如未读数量，最长为8个半角字符
    tabBut.badgeValue = @"1";
    
    self.tabBarItem = tabBut;
    
    
    
}


//点击屏幕触发
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //创建一个子视图并推出
    VC_1_view* _1view = [[VC_1_view alloc]init];
    _1view.view.backgroundColor = [UIColor orangeColor];
    _1view.title = @"视图1";
    
    [self.navigationController pushViewController:_1view animated:YES];
    
    _1view.delegate = self;
    
}

-(void)changeBKColor:(UIColor *)color
{
    self.view.backgroundColor = color;
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
