//
//  VC_2_view.m
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "VC_2_view.h"

@interface VC_2_view ()

@end

@implementation VC_2_view

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个图标按钮
    UITabBarItem* tabBut1 = [[UITabBarItem alloc]
                            initWithTabBarSystemItem:UITabBarSystemItemDownloads
                             tag:1001];
    //设置分栏控制器的图标按钮为tabBut1
    self.tabBarItem = tabBut1;
    
    UIBarButtonItem* tabBut2 = [[UIBarButtonItem alloc]initWithTitle:@"changeColor" style:UIBarButtonItemStylePlain target:self action:@selector(pressChange)];

    // 把按钮加入导航控制器的右边
    self.navigationItem.rightBarButtonItem = tabBut2;

}

-(void) pressChange
{
    //代理做要做的事，代理事件
    [self changeColor:[UIColor purpleColor]];
    
}

//定义代理事件
-(void)changeColor:(UIColor *)color
{
    [_delegate changeColor:color];
    NSLog(@"调用者：请使用此颜色！");
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
