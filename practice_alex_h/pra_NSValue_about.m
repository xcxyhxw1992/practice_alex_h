//
//  pra_NSValue_about.m
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_NSValue_about.h"

@interface pra_NSValue_about()


@end

@implementation pra_NSValue_about


- (void)testvalue{
    
    test mytest ;
    mytest.i  = 10;
    mytest.n  = 11.1;
    mytest.u  = 'A' ;
    self.myvalue =  [[NSValue alloc] initWithBytes:&mytest objCType:@encode(test)];
}

@end
