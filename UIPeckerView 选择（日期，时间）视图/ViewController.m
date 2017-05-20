//
//  ViewController.m
//  UIPeckerView 选择（日期，时间）视图
/*
 
 显示多组多个元素，以供选择，一般用在已知全部元素的组数，个数和内容，供用户选择，也只能选择已列出的内容
 
 如，时间，日期，性别，部门，班级等
 
 
 
 相关协议
    dataSource                              数据代理对象
    number Of Componentsl In PickerView     获得分组个数协议
    number Of Rows In Component             获得行数协议
    title For Row                           获得无素文字协议
    row Height For Component                设置行高协议
    view For Row                            获取视图对象元素协议
 
 1､ 引入协议 
         <
         //普通代理协议，处理视图选取等普通事件的协议功能
         UIPickerViewDelegate,
         //数据代理协议，处理获取数据的代理协议
         UIPickerViewDataSource
         >
 
 2､创建并设置选择视图，设置使用代理协议的对象
 
 
 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //创建一个选择视图
    UIPickerView* pickView = [[UIPickerView alloc]init];
    
    //设置视图大小及位置
    pickView.frame = CGRectMake(10, 100, 300, 200);
    
    //设置两个代理协议的引用者是当前视图控制器
    pickView.delegate = self;
    pickView.dataSource = self;
    
    //把选择视图加到当前视图中
    [self.view addSubview:pickView];
    
    
}

//实现协议中必须实现的函数---------------------------------->
// 创建选择视图将自动调用以下函数：调用方法类似循环方法

// 一、确定组数
// 返回值 设置 选择视图中的 组数
// P1 : (UIPickerView *)pickerView 传入调用这一函数的 选择视图
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //用传入的参数可以对 选择视图进行操作
    pickerView.backgroundColor = [UIColor whiteColor];
    
    //设置 选择视图有一共有两组数据
    return 3;
}

// 二、多次调用此函数，调用次数与组数一致
// 返回值 设置 选择视图 每组中的 行数
// P1 : (UIPickerView *)pickerView 传入调用这一函数的 选择视图
// P2 : numberOfRowsInComponent:(NSInteger)component 传入一个数，指定当前要设置的是第几组元素
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //传入的参数表示当前要设置第几组数据的行数
    //int sss = component;
    
    //设置 选择视图中第 sss 组数据的行数为 3
    return 8;
}

// 三、多次调用此函数，调用次数等于总元素数
// 返回值 设置 选择视图中指定位置的 内容
// P1 : (UIPickerView *)            pickerView  传入调用这一函数的 选择视图
// P2 : titleForRow:(NSInteger)     row         传入一个数，指定当前的行数
// P3 : forComponent:(NSInteger)    component   传入一个数，指定当前的组数
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    int 行 = row;
    int 组 = component;
    
    NSString* str = [NSString stringWithFormat:@"%d组,%d行",组+1,行+1];
    
    return str;
}
//其它协议---------------------------------------------------------------->

//设置行高
-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

/*/把自定义的视图当作元素，显示在选择视图中
-(UIView*) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage* aImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d.JPG",(row+1)*(component+1) ]];
    UIImageView* imgView = [[UIImageView alloc]initWithImage:aImage];
    
    imgView.frame = CGRectMake(0, 0, 40, 40);
    return imgView;
}*/

//获取选中的行和组，并进行下一步操作
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"第%d组中选择的目标是第%d行",component+1,row+1);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
