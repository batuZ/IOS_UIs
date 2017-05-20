//
//  VCRoot.m
//  UIs
//
//  Created by 张智 on 16/7/17.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "VCRoot.h"
#import "View01.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    //都是设置当前导航栏的 title 文字
    //当设置 navigationItem.title 系统会这个内容
    //当设置 navigationItem.title 系统会自动使用 self.title 的内容
    //当两个 title 都没有设置的话，不显视
    self.title = @"根视图";
   // self.navigationItem.title = @"rootView";
    
    //设置是否透明
    self.navigationController.navigationBar.translucent = NO;
    
    //设置导航栏风格
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    //根据 title 创建一个导航栏按钮
    //P1 按钮上的文字
    //P2 按钮风格 , 有全部系统风格（枚举）或自定义风格
    //P3 事件拥有者
    //P4 事件
    
    //自定义风格   style:UIBarButtonItemStyleDone 自定义风格
    UIBarButtonItem* itemCun = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(leftPress)];
    
    //系统风格
    UIBarButtonItem* itemSys = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightPress)];
    
    //把导航按钮赋值给导航栏
    
    //只有一个时用BarButtonItem
        //左侧赋值一个自定义按钮
        self.navigationItem.leftBarButtonItem = itemCun;
        //右侧赋值一个系统按钮
        self.navigationItem.rightBarButtonItem = itemSys;
    
    //多个按钮时用BarButtonItems 赋值一个数组
    
        //右侧赋值多个自定义按钮，先定义按钮对像,开关控件＼标签控件＼按钮控件....
        //所有控件都可以通过[[UIBarButtonItem alloc]initWithCustomView: 来转换成自定义的导航栏按钮
        
        UISwitch* itm01 = [[UISwitch alloc]initWithFrame:CGRectMake(0, 0, 30, 1)];
        UIBarButtonItem* itm001 = [[UIBarButtonItem alloc]initWithCustomView:itm01];

        UIButton* itm03 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [itm03 setTitle:@"next" forState:UIControlStateNormal];
        itm03.frame = CGRectMake(0, 0, 30, 20);
        UIBarButtonItem* itm003 = [[UIBarButtonItem alloc]initWithCustomView:itm03];
        [itm03 addTarget:self action:@selector(rightPress) forControlEvents:UIControlEventTouchDown];
    
        //把所有需要加入导航栏的按钮对像先加入一个数组中
        NSArray *itmArray = [NSArray arrayWithObjects:itm003, itm001,nil];
        //再把数组赋值给导航栏
        self.navigationItem.rightBarButtonItems = itmArray;
    
        //左侧赋值多个系统按钮
        UIBarButtonItem* sysItm01 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(leftPress)];
        UIBarButtonItem* sysItm02 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(leftPress)];
        
        NSArray* sysItmArray = [NSArray arrayWithObjects:sysItm01,sysItm02, nil];
        
        self.navigationItem.leftBarButtonItems = sysItmArray;
}

//响应事件

//实现切换视图
-(void)rightPress{
    //创建子视图的实例对象
    View01* temp01 = [[View01 alloc]init];
    //把子视图对象(temp01)赋值给当前视图控制器(VCRoot)的导航控制器对象(self.navigationController)
    [self.navigationController pushViewController:temp01 animated:YES];
}

-(void)leftPress{
    
    
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
