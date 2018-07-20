//
//  pra_clothesProvider.m
//  practice_alex_h
//
//  Created by hxw on 2018/7/19.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_clothesProvider.h"


@implementation pra_clothesProvider


- (void)purchaseClothsWithSize:(clothesSize) size
{
    
 
    NSString * sizer ;
    
    switch (size) {
        case S:
            sizer  =@"S size" ;
            break;
        case XL:
            sizer  =@"XL size" ;
            break;
        case XXL:
            sizer  =@"XXL size" ;
            break;
        default:
            sizer  =@"no size support" ;
            break;
    }
    
    NSLog(@"buy clothes size is %@",sizer);
    
}
@end
