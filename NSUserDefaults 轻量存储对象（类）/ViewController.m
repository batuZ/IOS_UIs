//
//  ViewController.m
//  NSUserDefaults 轻量存储对象（类）
/*
 
 这是一个全局的类，可以跨类存取全局数据，是一个非常方便的类
 类对象会在沙盒中创建一个文件，保存放入的数据 
 单例模型类，全局只有唯一一个类对象，第一次声明时创建，以后都打开
 是通过 Key 存入取出， 只支持可写入文件的数据，如：int bool double string ...
 指针、动态创建的对象或不能文件华的对象不能存入,个人感觉很像把变量存在磁盘中，且没有作用域
 
 常用方法：
    set Object For Key  根据值和key存对象
    set Integer         存整型值
    set Bool            存布尔值
    ...
 
    object For Key      根据Key取对象
    integer For Key     根据Key取整型
    bool For Key        根据Key取布尔
    ...
 
    removeObjectForKey  清除
 
 //查询其中全部内容
     NSDictionary* sdsd = [udf dictionaryRepresentation];
     NSLog(@"NSDictionary:%@",sdsd);
 
 
 
 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton* but1 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame = CGRectMake(120, 200, 100, 40);
    [but1 addTarget:self action:@selector(pressBut1) forControlEvents:UIControlEventTouchUpInside];
    
    [but1 setTitle:@"saveFile" forState:UIControlStateNormal];
    [self.view addSubview:but1];

    UIButton* but2 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but2.frame = CGRectMake(120, 260, 100, 40);
    [but2 addTarget:self action:@selector(pressBut2) forControlEvents:UIControlEventTouchUpInside];
    [but2 setTitle:@"openFile" forState:UIControlStateNormal];
    [self.view addSubview:but2];
    
}


//  SaveFile
-(void)pressBut1
{
    //创建或打开或调用或声明，唯一的userDef对象
    NSUserDefaults* uDef = [NSUserDefaults standardUserDefaults];
   
    
    [uDef setObject:@"batu" forKey:@"NAME"];
    [uDef setObject:[NSNumber numberWithInt:35] forKey:@"年龄"];
    [uDef setObject:[NSArray arrayWithObjects:@"a",@"b",@"c", nil] forKey:@"abc"];
    [uDef setInteger:35 forKey:@"驾龄"];
    [uDef setBool:YES forKey:@"True"];
    [uDef setDouble:3.141592654 forKey:@"PI"];

}

//  OpenFile
-(void)pressBut2
{

    NSUserDefaults* udf = [NSUserDefaults standardUserDefaults];
    
    id object = [udf objectForKey:@"NAME"];
    NSString* name =(NSString*)object;
    NSLog(@"%@",name);
    
    NSNumber* num = [udf objectForKey:@"年龄"];
    NSLog(@"%@",num);
    
    NSArray* arr = [udf objectForKey:@"abc"];
    NSLog(@"%@",arr);

    double ss = [udf doubleForKey:@"PI"];
    NSLog(@"%f",ss);
    
    NSDictionary* sdsd = [udf dictionaryRepresentation];
    NSLog(@"NSDictionary:%@",sdsd);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
