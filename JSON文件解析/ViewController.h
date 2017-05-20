//
//  ViewController.h
//  JSON文件解析
//
//  Created by 张智 on 16/7/30.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
>

{
    UITableView* mytab;
    NSMutableArray* arrPersons;
    NSMutableArray* arrClass;
}

@end

