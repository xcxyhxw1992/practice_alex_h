//
//  ViewController.m
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "ViewController.h"
#import "pra_NSCache.h"


@interface ViewController ()

@property (nonatomic ,strong) pra_NSCache *  pra_cache ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self cachenethod];
}

#pragma mark getter

- (pra_NSCache *)pra_cache
{
    
    if (!_pra_cache) {
        _pra_cache = [[pra_NSCache alloc] init];
    }
    return _pra_cache ;
    
    
}




#pragma mark method

- (void)cachenethod
{
    [self.pra_cache startCache];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC));
    NSLog(@"---");
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"++");
        [self.pra_cache checkCache];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [self.pra_cache deleteCaheData];
        });
        
    });

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
