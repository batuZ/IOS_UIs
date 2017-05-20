//
//  ViewController.h
//  UIPan\Swipe\LongPress 扩展手势
//
//  Created by 张智 on 16/7/2.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
{
    //平移手势
    UIPanGestureRecognizer* _myPan;
    //滑动手势 左右上下
    UISwipeGestureRecognizer* _mySwipe;
    //长按手势
    UILongPressGestureRecognizer* _myLongPress;
    UIView* _myImgView;
    
    CGPoint _after;
}

@end

