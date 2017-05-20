//
//  View01.m
//  UIs
//
//  Created by 张智 on 16/7/17.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "View01.h"
#import "View02.h"
@interface View01 ()

@end

@implementation View01

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.title = @"view1";
    
    //添加一个导航栏系统按钮
    UIBarButtonItem* nextBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(nextPress)];
    
    self.navigationItem.rightBarButtonItem = nextBar;
}

-(void)nextPress{
    View02* temp = [[View02 alloc]init];
    [self.navigationController pushViewController:temp animated:YES];
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
