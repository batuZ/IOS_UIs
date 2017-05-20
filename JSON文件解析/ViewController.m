//
//  ViewController.m
//  JSON文件解析
/*
 
 JSON : JavaScript Object Notation
 
 轻量级数据交换格式,由数组和字典组成
 
 语法规则
 数据都在键值对中，由大括号标示内容｛字典｝
 多个数据由逗号分割，用中括号括起，表示数组 ［｛字典｝,｛字典｝,｛数据｝］
 都是以“｛ ” 开始，以 “ ｝”结束
 
 常用函数
 SBJsonParser:                   JSON数据解析类
 objectWithString:jsonString:    解析字符串数据
 NSJSONSerialization:            IOS默认JSON解析类
 JSONObjectWithData:             解析类中的一个重要函数
 通过二进制解析数据
 把返回值存入数组或字典
 
 
 字典（数据）：{
 "name":"batu",
 "sex":,"man",
 "age":"18"
 }
 
 数组：{
 "persons":[
 {
 "name":"sam",
 "sex":,"woman",
 "age":"22"
 },
 
 {
 "name":"batu",
 "sex":,"man",
 "age":"18"
 },
 
 {
 "name":"zhangzhi",
 "sex":,"man",
 "age":"35"
 }
 ],
 "classes":
 {
 "first":"一年级",
 "secend":"二年级",
 "thried":"三年级"
 }
 }
 
 */


#import "ViewController.h"
#import "student.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self pressData];

    //创建分组风格的表格视图
    mytab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    
    mytab.delegate =self;
    mytab.dataSource =self;
    
    
    [self.view addSubview:mytab];

}

//组数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return arrClass.count;
}

//行数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrPersons.count;
}

//创建单元格
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* strID = @"ID";
    //尝试获取复用单元格
    UITableViewCell* cell = [mytab dequeueReusableCellWithIdentifier:strID];
    //获取为空，则新建
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    
    //通过传入的行数 获取学生数组中的 学生对象
    student* stu = [arrPersons objectAtIndex:indexPath.row];
    
    // 名字赋给单元格
    cell.textLabel.text = stu.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"年龄：%@  性别：%@ ", stu.age,stu.sex];
    return cell;
}

//解析数据
//声明一个局部变量,数据字典
NSDictionary* rootDic;

-(void)pressData
{
    
    // pass1,加载数据
    //NSBundle mainBundle 获取主资源包
    //pathForResource 获取目标文件全路径
    //参数1 文件名  参数二 扩展名
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"ss" ofType:@"json"];
    
    // pass2, 把数据以（返回二进制）读进内存 , 通过文件＼网址＼其它...
    NSData* jsonData = [NSData dataWithContentsOfFile:filePath];
    
    // pass3, 解析ＪＳＯＮ
    //NSJSONSerialization  JSON解析类
    //JSONObjectWithData   以二进制读取JSON对象
    //参数：jsonData        数据对象
    //options:可选的数据解析方式：
    //NSJSONReadingMutableContainers 默认的
    //error：错误信息
    //把解析后的数据保存在字典中
    
    rootDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    //正常获取到数据后，开始解析
    if([rootDic isKindOfClass:[NSDictionary class]])
    {
        //初始化一个学生表
        arrPersons = [[NSMutableArray alloc]init];
        
        //拿到第一级内容：rootDic 中 persons 的值，值类型为数组，所以lev1的类型为NSArray
        NSArray* lev1 = [rootDic objectForKey:@"persons"];
        
        //遍历lev1的成员，拿到数组内容
        for (int i =0 ; i<lev1.count; i++)
        {
            //初始化一个学生对象
            student* aStu = [[student alloc]init];
            
            //拿到第二级内容：lev1 中 name\age\sex 的值，值类型为字典，所以lev1的类型为NSDictionary
            NSDictionary* lev2 = [lev1 objectAtIndex:i];
            //把字典中的值赋给对象
            aStu.name = [lev2 objectForKey:@"name"];
            aStu.age = [lev2 objectForKey:@"age"];
            aStu.sex = [lev2 objectForKey:@"sex"];
            [arrPersons addObject:aStu];
        }
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
