//
//  VCroot.h
//  UIs
//
//  Created by 张智 on 16/7/29.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>
    // pass5,引入调用类的头文件，代理声明都在这里
#import "VC_1_view.h"
    // pass6,引入代理协议名
@interface VCroot : UIViewController<VC_1_viewDelegate>

@end
