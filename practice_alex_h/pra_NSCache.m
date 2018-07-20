//
//  pra_NSCache.m
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_NSCache.h"

@interface pra_NSCache()

@property (nonatomic, strong) NSCache * cache ;

@end

@implementation pra_NSCache


- (NSCache *)cache
{
    if (!_cache) {
        _cache  = [[NSCache alloc] init];
        _cache.delegate = self ;
        _cache.totalCostLimit = 5;
    }
    return _cache;
}


- (void)startCache
{
    
    for (NSInteger  i = 0 ; i < 8; i ++) {

        NSString * str = [NSString stringWithFormat:@"对象%ld",i];
        
        [self.cache  setObject:str forKey:@(i) cost:0];
        
        NSLog(@"储存数据---%@__",@(i));
    }
}

- (void)checkCache
{
    for (NSInteger i = 0 ; i < 8 ; i++) {
    
        NSString * str  = [self.cache objectForKey:@(i)];
        
        if (str) {
            NSLog(@"取出缓存中的数据---%@--",@(i));
        }else
        {
            NSLog(@"%@号元素丢失",@(i));
        }
        
    }
    
}


- (void)deleteCaheData
{
    [self.cache removeAllObjects];
    NSLog(@"清理 cache ");
}

#pragma  mark delegate

- (void)cache:(NSCache *)cache willEvictObject:(id)obj
{
    NSLog(@"回收存储对象%@",obj);
    
}
@end
