//
//  VC_1_view.h
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>
    // pass1,声明代理关键词@protocol ＋ 当前类名 ＋ Delegate
@protocol VC_1_viewDelegate <NSObject>

    // pass2,声明当前类要做的 必须由代理实现的 事件
-(void) changeBKColor:(UIColor*) color;

@end

@interface VC_1_view : UIViewController

    // pass3,声明一个代理对象，泛型类型 ＋ 代理协议名 ＋ 对象名
@property (nonatomic,assign) id <VC_1_viewDelegate> delegate;

@end
