//
//  ViewController.h
//  UIStepper&UISegmentedControl步进器&分栏控件
//
//  Created by 张智 on 16/6/19.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    UIStepper* _mystep;
    UISegmentedControl* _myseg;
}

@property (retain,nonatomic) UIStepper* myStepper;
@property (retain,nonatomic) UISegmentedControl* mySegmentedControl;

@end

