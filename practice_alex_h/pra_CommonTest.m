//
//  pra_CommonTest.m
//  practice_alex_h
//
//  Created by hxw on 2018/7/19.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_CommonTest.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation pra_CommonTest



- (void)commonTest
{
    
    unsigned int  numberOfMethods = 0 ;
    
    Method * method_list = class_copyMethodList(NSClassFromString(@"pra_NSCache"), &numberOfMethods);
    
    
    for (NSInteger  i = 0; i; i ++) {
        
    }
    
    
}
@end
