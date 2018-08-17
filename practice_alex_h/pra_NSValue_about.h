//
//  pra_NSValue_about.h
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef struct {
    int  i ;
    float n ;
    unsigned  char u ;
    
}test;

@interface pra_NSValue_about : NSObject
- (void)testvalue ;
@property (nonatomic, strong) NSValue * myvalue ;

@end
