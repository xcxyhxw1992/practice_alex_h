//
//  ViewController.m
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "ViewController.h"
#import "pra_NSCache.h"
#import "pra_ViewController_A.h"
#import "pra_ViewController_B.h"
#import "pra_NSValue_about.h"
#import "pra_NSbundle.h"
#import "pra_MCustom_View.h"

@interface ViewController ()

@property (nonatomic ,strong) pra_NSCache *  pra_cache ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
//    [self cachenethod];
//    [self addVC];
//    [self valueAbout];
    [self performSelector:@selector(bundleSomeMethod) withObject:nil afterDelay:1.0];
    [pra_MCustom_View  viewAddedInSuperView:self.view];
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



#pragma mark childVC

- (void)addVC
{
    pra_ViewController_A * Avc = [[pra_ViewController_A alloc] init];
    Avc.view.frame = CGRectMake(0, 100, [UIScreen mainScreen] .bounds.size.width, 300);
    [self addChildViewController:Avc];
    [self.view addSubview:Avc.view];
    
//    [Avc didMoveToParentViewController:self];
    
}

- (void)valueAbout
{
    
    pra_NSValue_about * valueObj = [[pra_NSValue_about alloc] init];
    [valueObj testvalue];
    test  mytest ;
    [valueObj.myvalue getValue:&mytest];
    
    NSLog(@"value.i = %d,\n vaule.n= %f,\n value.u = %c",mytest.i ,mytest.n ,mytest.u);
}

- (void)bundleSomeMethod{
    printMainbule();
    printCachePathType();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
