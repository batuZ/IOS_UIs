//
//  vc01.m
//  UIs
//
//  Created by 张智 on 16/7/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "vc01.h"

@interface vc01 ()

@end

@implementation vc01

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect a = [UIScreen mainScreen].bounds;
    UILabel* lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    lab.center = CGPointMake(a.size.width/2, a.size.height/2);
    lab.text =@"1111111111";
    [self.view addSubview:lab];
    self.view.backgroundColor = [UIColor blueColor];

    //设置一个系统图标，系统图标的样式是固定的，不能改变
    UITabBarItem* tabBut = [[UITabBarItem alloc]
                            initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1001];
    
    //设置提示信息，如未读数量，最长为8个半角字符
    tabBut.badgeValue = @"1";
    
    self.tabBarItem = tabBut;
    

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
