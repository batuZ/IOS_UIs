//
//  ViewController.h
//  UITableView 表格视图
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<//用于视图普通协议事件
UITableViewDelegate,
//用于视图数据相关事件
UITableViewDataSource
>

{
    UITableView* myTab;
    NSMutableArray* arrData;
    NSMutableArray* selectDatas;
    UIBarButtonItem* _edit;
    UIBarButtonItem* _done;
    UIBarButtonItem* _delet;
    BOOL _isEdit;
}


@end

