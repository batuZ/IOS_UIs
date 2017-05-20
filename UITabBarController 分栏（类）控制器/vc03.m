//
//  vc03.m
//  UIs
//
//  Created by 张智 on 16/7/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "vc03.h"

@interface vc03 ()

@end

@implementation vc03

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect a = [UIScreen mainScreen].bounds;
    UILabel* lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    lab.center = CGPointMake(a.size.width/2, a.size.height/2);
    lab.text =@"33333333";
    [self.view addSubview:lab];
    //设置一个图片图标，可以自定义 title 和 图标图片
    self.view.backgroundColor = [UIColor grayColor];
    UIImage* aIMG = [UIImage imageNamed:@""];
    UITabBarItem* tabBut = [[UITabBarItem alloc]
                            initWithTitle:@"在成员中" image:aIMG tag:1001];
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
