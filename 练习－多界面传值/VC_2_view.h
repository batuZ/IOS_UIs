//
//  VC_2_view.h
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>
//引入代理头文件
#import "VC_2_viewDelegate.h"
//引入代理协议名
@interface VC_2_view : UIViewController<VC_2_viewDelegate>
//声明一个代理对象，这个对象会执行协议,完成要做的事，id为泛型
@property (nonatomic,assign) id <VC_2_viewDelegate> delegate;

@end
