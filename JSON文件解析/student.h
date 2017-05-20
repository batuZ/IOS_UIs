//
//  student.h
//  UIs
//
//  Created by 张智 on 16/8/2.
//  Copyright © 2016年 BT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface student : NSObject
{
    NSString* _name;
    NSString* _sex;
    NSString* _age;
    NSString* _classes;
}

@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSString* sex;
@property(nonatomic,retain) NSString* age;
@property(nonatomic,retain) NSString* classes;

@end
