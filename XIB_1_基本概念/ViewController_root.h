//
//  ViewController_root.h
//  UIs
//
//  Created by 张智 on 16/7/2.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController_root : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *a;

@property (weak, nonatomic) IBOutlet UILabel *aaa;

@property (weak, nonatomic) IBOutlet UILabel *ew;
@property (weak, nonatomic) IBOutlet UITextField *ff;
@property (weak, nonatomic) IBOutlet UITextField *cc;
@property (weak, nonatomic) IBOutlet UIButton *fff;
@property (weak, nonatomic) IBOutlet UIButton *vv;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bb;

@property (weak, nonatomic) IBOutlet UILabel *dd;
- (IBAction)bbbbbbb:(UITextField *)sender;


@end
