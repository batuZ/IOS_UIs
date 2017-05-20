//
//  AppDelegate.h
//  练习－多界面传值
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC_2_viewDelegate.h"
#import "VCroot.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,VC_2_viewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic , retain) VCroot* root;
@end

