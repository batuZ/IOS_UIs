//
//  ViewController.h
//  UIPeckerView 选择（日期，时间）视图
//
//  Created by 张智 on 16/7/28.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<
//普通代理协议，处理视图选取等普通事件的协议功能
UIPickerViewDelegate,
//数据代理协议，处理获取数据的代理协议
UIPickerViewDataSource
>

@end

