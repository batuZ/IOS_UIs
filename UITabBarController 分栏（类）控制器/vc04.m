//
//  vc04.m
//  UIs
//
//  Created by 张智 on 16/7/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "vc04.h"

@interface vc04 ()

@end

@implementation vc04

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect a = [UIScreen mainScreen].bounds;
    UILabel* lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 30)];
    lab.center = CGPointMake(a.size.width/2, a.size.height/2);
    lab.text =@"44444444";
    [self.view addSubview:lab];
    self.title = @"只在成员中";
    self.view.backgroundColor = [UIColor redColor];
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
