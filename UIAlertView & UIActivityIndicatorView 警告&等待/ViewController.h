//
//  ViewController.h
//  UIAlertView & UIActivityIndicatorView 警告&等待
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (retain,nonatomic) UIAlertView* myAlert;
@property (retain,nonatomic) UIActivityIndicatorView* myActivity;

@end

