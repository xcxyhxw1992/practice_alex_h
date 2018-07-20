//
//  pra_NSCache.h
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pra_NSCache : NSObject <NSCacheDelegate>


- (void)startCache ;
- (void)checkCache ;
- (void)deleteCaheData;

@end
