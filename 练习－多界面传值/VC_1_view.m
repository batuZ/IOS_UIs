//
//  VC_1_view.m
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "VC_1_view.h"

@interface VC_1_view ()

@end

@implementation VC_1_view

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}



//点击退出本视图
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self changeBKColor:[UIColor yellowColor]];
    [self.navigationController popViewControllerAnimated:YES];
    
}


    // pass4,定义需要通过代理做的事，代理事件
-(void)changeBKColor:(UIColor *)color
{
    [_delegate changeBKColor:color];
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
