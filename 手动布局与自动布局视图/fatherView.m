//
//  fatherView.m
//  UIs
//
//  Created by 张智 on 16/7/15.
//  Copyright © 2016年 BT. All rights reserved.
//

#import "fatherView.h"
#import "sunView.h"
@implementation fatherView

//当此视图发生变化时触发此函数
//用于对子视图的位置大小进行重新布局
-(void)createSun{

    //create some sunviews
    sun1= [[UIView alloc]init];
    sun2= [[UIView alloc]init];
    sun3= [[UIView alloc]init];
    sun4= [[UIView alloc]init];
    sun5= [[UIView alloc]init];
    
    sun1.backgroundColor = [UIColor orangeColor];
    sun2.backgroundColor = [UIColor orangeColor];
    sun3.backgroundColor = [UIColor orangeColor];
    sun4.backgroundColor = [UIColor orangeColor];
    sun5.backgroundColor = [UIColor orangeColor];
    
    CGRect a = self.bounds;
    //LU
    sun1.frame = CGRectMake(0, 0, 20, 20);
    //RU
    sun2.frame = CGRectMake(a.size.width-20, 0, 20, 20);
    //LD
    sun3.frame = CGRectMake(0, a.size.height-20, 20, 20);
    //RD
    sun4.frame = CGRectMake(a.size.width-20, a.size.height-20, 20, 20);
    //MID
    sun5.frame = CGRectMake(0, a.size.height/2-10, a.size.width, 20);
    
    [self addSubview:sun1];
    [self addSubview:sun2];
    [self addSubview:sun3];
    [self addSubview:sun4];
    [self addSubview:sun5];
    
    //自动布局子视图：
    
    //Filexibl... 指定的方向与父级的关系是可变的
    //Ex:UIViewAutoresizingFlexibleLeftMargin 表示此视图的左边与父视图的关系是可变的
    //Ex:UIViewAutoresizingFlexibleWidth 表示宽度与父视图的相对关系不变
    /*
     *  sun4.autoresizingMask = UIViewAutoresizingNone;
     *       UIViewAutoresizingFlexibleWidth;
     *       UIViewAutoresizingFlexibleHeight;
     *       UIViewAutoresizingFlexibleTopMargin;
     *       UIViewAutoresizingFlexibleBottomMargin;
     *       UIViewAutoresizingFlexibleLeftMargin;
     *       UIViewAutoresizingFlexibleRightMargin;
     */
    
    sun1.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    sun2.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
    sun3.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    sun4.autoresizingMask =
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    sun5.autoresizingMask =
    UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
   

}


///手动布局

-(void) layoutSubviews
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    CGRect a = self.bounds;
    //LU
    sun1.frame = CGRectMake(0, 0, 20, 20);
    //RU
    sun2.frame = CGRectMake(a.size.width-20, 0, 20, 20);
    //LD
    sun3.frame = CGRectMake(0, a.size.height-20, 20, 20);
    //RD
    sun4.frame = CGRectMake(a.size.width-20, a.size.height-20, 20, 20);
    //MID
    sun5.frame = CGRectMake(0, a.size.height/2-10, a.size.width, 20);
    
    [UIView commitAnimations];
}



@end
