//
//  VC_2_viewDelegate.h
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <Foundation/Foundation.h>


//定义一个协议，VC_2_view的协议，创建VC_2_view时要实现本协议
@protocol VC_2_viewDelegate <NSObject>

//定义一个协议函数，想要做的事
-(void) changeColor:(UIColor*) color;

@end