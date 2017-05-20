//
//  VCphotos.m
//  UIs
//
//  Created by 张智 on 16/7/28.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "VCphotos.h"

@interface VCphotos ()

@end

@implementation VCphotos

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 213)];
    
    _imgView.center = CGPointMake(320/2, 480/2);
    
    _imgView.image = _img;
    
    [self.view addSubview:_imgView];
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
