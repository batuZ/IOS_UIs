//
//  ViewController.m
//  UITableView 表格视图
/*
 用途非常广泛 如：通讯录＼邮件＼短信等相同类别的内容，可根据特性分组
 代理协议：
 data Source                         数据代理协议
 delegate                            普通代理协议
 
 必须的和必要的
 number Of Sections In TableView     设置组数
 number Of Row In Section            设置行数
 cell For Row At Index Path          创建单元格
 
 调整样式的
 height For Row At Index Path        设置单元格高度
 height For Header In Section        设置视图头部高度
 Height For Footer In Section        设置视图尾部高度
 title For Footer In Section         设置视图尾部标题
 title For Header In Section         设置视图头部标题
 
 高级响应
 commit Editing Style                提交编辑函数
 can Edit Row At Index Path          编辑状态开关
 editing Style For Row At Indxe Path 单元格风格设置
 did Select Row At Index Path        选中单元格响应事件
 did Deselect Row At Index path      取消选中响应事件
 
 
 
 
 
 1､ 引入代理协议
 2､ 创建表格视图并加入父视图
 需要有数据源 NSArray ，声明数据源变量
 
 3､ 实现必须及必要的代理协议
 4､ 设置单元格样式的协议
 5、单元格高级协议
 
 
 */


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createBut];
    
    // pass1 ,创建表格视图，myTab:分组风格 ，_myTabView:普通风格
    myTab = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    
    // pass2 ,设置使用代理协议的对象
    myTab.delegate          = self;
    myTab.dataSource        = self;
    
    
    //
    //    //表格视图的头部视图（照片等，UIView对象）
    //    myTab.tableHeaderView = nil;
    //    //表格视图的尾部视图 （介绍等）
    //    myTab.tableFooterView = nil;
    //
    //
    
    //加入父视图
    [self.view addSubview:
     myTab
     //_myTabView
     ];
    
    
    //数据源:一个可变的二维数组，按字母分组，每组有五行
    arrData = [[NSMutableArray alloc]init];
    for (int i = 'A'; i<= 'Z'; i++)
    {
        //创建一个小数组，代表每个组
        NSMutableArray* sArr = [[NSMutableArray alloc]init];
        
        for (int j = 'a'; j<= 'e'; j++)
        {
            NSString* str =[ NSString stringWithFormat:@"%c - %c" , i,j ];
            //把内容加到小数组中
            [sArr addObject:str];
        }
        
        //把小数组加到大数组中
        [arrData addObject:sArr];
    }
    
    
    //当数据源发生变化时，重新加载数据，更新视图
    [myTab reloadData];
    
    
}

// pass3 ,实现必须实现的（UITableViewDataSource中的）协议事件----------------------------->

//返回值 设置每个组中的 ＃行数＃ ,视图在加载前要调用此函数，必须实现
//P1：tableView 是表格视图本身
//P2：section 传入一个值，表示当前设置的是第 section 组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *sArr = arrData[section];
    NSInteger a = sArr.count;
    return a;
}


//返回值设置 每个单元格的内容
//P1：tableView 是表格视图本身
//P2：indexPath 带入＃行数＃组数＃
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义一个统一标识字符
    NSString* str = @"cell";
    
    //通过统一标识字符，尝试获取可复用单元格
    //复用的概念：
    //      在单元格数量较多时，会超出屏幕，上下滑动操作时，新进入屏幕的单元格不会新创建对象，
    //      而是使用刚刚出屏的单元格对象
    //      当没有单元格出屏（也就是变为可复用）时，会创建一个新的单元格对象
    UITableViewCell* cell = [myTab dequeueReusableCellWithIdentifier:str];
    
    //如果调到的对象为空，则创建一个单元格，不为空则跳过创建直接使用
    if (cell==nil) {
        //创建单元格
        //单元格风格：
        //  UITableViewCellStyleDefault 默认风格
        //  UITableViewCellStyleSubtitle 带子标题
        //定义此单元格标识字符为 str
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    
    //只有子标题风格可以显视
    cell.detailTextLabel.text = @"子标题";

    //加入图像
    cell.imageView.image = [UIImage imageNamed:@"3.JPG"];
    
    
    // 重要！传入的参数 indexPath 带有两个属性
    //indexPath.section 为组数
    NSInteger a = indexPath.section;
    
    //indexPath.row 为当前组的行数
    NSInteger b = indexPath.row;
    
    //设置当前单元格的文字内容
    cell.textLabel.text = arrData[a][b];
    
    return cell;
}


// pass4 ,实现必要的协议事件----------------------------------------------------------->

//返回值 设置表格视图中的 ＃组数＃
//在视图加载前 ，会多次调用 ＃行数＃ 函数，调用的次数就是这个返回值
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger a = arrData.count;
    return a;
}


// pass5 ,通过代理协议设置表格视图的样式----------------------------------------------->
/*
 调整样式的
 height For Row At Index Path        设置单元格高度
 height For Header In Section        设置视图头部高度
 Height For Footer In Section        设置视图尾部高度
 title For Footer In Section         设置视图尾部标题
 title For Header In Section         设置视图头部标题
 */
//设置单元格高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
//设置组头高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}
//设置组尾高度
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 25;
}
//设置组头标签内容
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    int i = 'A';
    NSString* a = [NSString stringWithFormat:@"%c",i+section];
    return a;
}
//设置组尾标签内容
-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString* a = [NSString stringWithFormat:@"以上为第%ld组表格",(long)section ];
    return a;
}

// pass5 ,高级协议，编辑和事件响应 ----------------------------------------------->
/*
 高级响应
 commit Editing Style                提交编辑函数
 can Edit Row At Index Path          编辑状态开关
 editing Style For Row At Indxe Path 单元格风格设置
 did Select Row At Index Path        选中单元格响应事件
 did Deselect Row At Index path      取消选中响应事件
 */

//提交编辑函数，当手指在单元格上滑动时，可以显视单个单元格的编辑状态，并响应编辑操作
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //编辑过程1 从数据源中添加或删除
    //先拿到要编辑的组
    NSMutableArray* se = arrData[indexPath.section];
    //对组里的行进行操作
    [se removeObjectAtIndex:indexPath.row];
    //如果组里没有内容了，则删掉组
    if(se.count==0)
        [arrData removeObjectAtIndex:indexPath.section];
    //更新数据源和视图
    [myTab reloadData];
}

//编辑状态开关,是否可以通过 setEditting 开启编辑状态
-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{return YES;}

//单元格风格设置
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    为空的编辑状态
    //    return UITableViewCellEditingStyleNone;
    //    默认为delete
    //   return UITableViewCellEditingStyleDelete;
    //    return UITableViewCellEditingStyleInsert;
    //    多选状态
    return UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
    
}
//选中单元格响应事件,多选时可以把选中的单元格索引加到一个数组中，待操作
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //创建选中的单元格索引
    NSIndexPath* select = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
     //把选中的单元格索引加到一个数组中
    [selectDatas addObject:select];
    NSLog(@"第 %d 个 ：[%d,%d]",selectDatas.count,select.section , select.row);
}

//取消选中响应事件，多选时可以把取消选中的单元格从选择数组中移除
-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //把取消选中的单元格从选择数组中移除
    [selectDatas removeObject:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    NSLog(@"[%d,%d]被取消选中！还有%d个成员",indexPath.section,indexPath.row,selectDatas.count);
    
}







//--------------------- UI ---------------------
-(void)createBut
{
    self.title= @"首页";
    
    _edit = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(pressEdit)];
    self.navigationItem.rightBarButtonItem = _edit;
    
}
//-------------------- BUT事件 --------------------
-(void)pressEdit
{
    self.navigationItem.rightBarButtonItem = nil;
    
    _done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem = _done;
    
    _delet = [[UIBarButtonItem alloc]initWithTitle:@"DELETE" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    self.navigationItem.leftBarButtonItem = _delet;
    
    //开启编辑状态
    [myTab setEditing:YES];
    
    //初始化一个选择集数组
    selectDatas = [[NSMutableArray alloc]init];

}
-(void)pressDone
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = _edit;
    [myTab setEditing:NO];
}
-(void)pressDelete
{
    for(int i = 0 ; i<selectDatas.count ; i++)
    {
        
        NSIndexPath* t = selectDatas[i];
        //从数据源中移除多个成员，实现多选删除，ＵＩ代码没有问题
        //需要再考虑 二维数组的 操作方法
        [arrData removeObjectAtIndex:t.section];
    }
    [myTab reloadData];
}

//---------------------------------------------------------









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
