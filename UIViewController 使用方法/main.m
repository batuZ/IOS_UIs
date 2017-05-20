//
//  main.m
//  UIViewController 使用方法
//
//  Created by 张智 on 16/6/13.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool//自动内存释放池
    {
        //下面是UIKit框架结构的启动函数
        //argc(int) 启动时所带参数的数量
        //argv(char[]) 参数列表
        //参数3(nil） 要求传入一个主框架的类名，如果为nil,系统会自动使用默认的框架类作为主框架类名
        //参数4 主框架的代理类对象名,也可以自定义代理类，但要继承AppDelegate再使用
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
