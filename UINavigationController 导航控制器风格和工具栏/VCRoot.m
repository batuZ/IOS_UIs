//
//  VCRoot.m
//  UIs
//


#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"rootView";
    UIBarButtonItem* but1 = [[UIBarButtonItem alloc]initWithTitle:@"leftBut" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.leftBarButtonItem = but1;
    
    
//以下是关于 导航栏 元素风格的设置命令----------------------------->
    
    //*设置导航栏是否半透，默认为ＹＥＳ
    self.navigationController.navigationBar.translucent = NO;

    //*导航栏风格：默认为白色半透，其它为黑色半透
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
         /*
         self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
         self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
         self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
         */
    
    //*设置导航栏底色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    //*设置导航栏按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    
    //*隐藏导航栏，以下两个方法效果相同，但所属不同
        /*
        self.navigationController.navigationBar.hidden = YES;//导航栏的属性
        self.navigationController.navigationBarHidden = YES;//导航控制器的属性
        */
    
//以下是关于 工具栏 的设置命令----------------------------->
    
    //* 开启（显视）工具栏，默认为隐藏（ＹＥＳ）
    self.navigationController.toolbarHidden = NO;
    
    //* 设置工具栏是否半透，与导航栏相同    
    self.navigationController.toolbar.translucent = NO;

    //* 设置工具栏风格，与导航栏相同
    self.navigationController.toolbar.barStyle = UIBarStyleDefault;
    
    //* 设置工具栏底色，与导航栏相同
    self.navigationController.toolbar.barTintColor = [UIColor orangeColor];
    
    //* 设置工具栏按钮颜色，与导航栏相同
    self.navigationController.toolbar.tintColor = [UIColor yellowColor];
    
    //* 为工具栏添加按钮,只能添加一个由按钮组成的数组，在工具栏中按顺序排列
        //系统风格
    UIBarButtonItem* tool01 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];
        //通过标签创建按钮
    UIBarButtonItem* tool02 = [[UIBarButtonItem alloc]initWithTitle:@"请输入" style:UIBarButtonItemStylePlain target:nil action:nil];
        //通过自定义控件创建按钮
    UIStepper* step = [[UIStepper alloc]init];
    UIBarButtonItem* tool03 = [[UIBarButtonItem alloc]initWithCustomView:step];
    
    
    //* 调整按钮之间的距离有两种方法： 并把占位按钮加入到按钮数组中
    
    //          1、在按钮之间添加一个手动计算距离的占位按钮
    UIBarButtonItem* shoudong = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //设定占位的宽度
    shoudong.width = 50;
    
    //          2、在按钮之前添加一个自动计算距离的占位按钮
    UIBarButtonItem* autoBar = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
        NSArray* arry =
            [[NSArray alloc]initWithObjects:
             tool01,
             //shoudong,//手动占位
             autoBar,//自动占位
             tool02,
             //shoudong,//手动占位
             autoBar,//自动占位
             tool03,
             nil];
    
    //* 把按钮数组加入到工具栏中
    self.toolbarItems = arry;
    
    
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
