//
//  ViewController.h
//  UIPinchGestrue 缩放手势
//
//  Created by 张智 on 16/6/26.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>
                                                //相关协意
@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

//声明一个捏合手势
@property (retain,nonatomic) UIPinchGestureRecognizer* myPinch;
//声明一个旋转手势
@property (retain,nonatomic) UIRotationGestureRecognizer* myRota;


@property (retain,nonatomic) UIImageView* myImgView;

@end

