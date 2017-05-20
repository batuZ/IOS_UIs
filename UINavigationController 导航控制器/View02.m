//
//  View02.m
//  UIs
//
//  Created by 张智 on 16/7/17.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "View02.h"

@interface View02 ()

@end

@implementation View02

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"view2";
    
    //设置右边的按钮
    UIBarButtonItem* backtoroot = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pressBack)];
    self.navigationItem.rightBarButtonItem = backtoroot;
    
    //设置左侧返回上一级按钮
    UIBarButtonItem* leftBack = [[UIBarButtonItem alloc]initWithTitle:@"回到上一级" style:UIBarButtonItemStyleDone target:self action:@selector(backUp)];
    
    self.navigationItem.leftBarButtonItem = leftBack;
}

-(void)pressBack{
    //直接返回根视图
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)backUp{
    //自定义返回上一级
    [self.navigationController popViewControllerAnimated:YES];
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
