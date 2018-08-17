//
//  pra_ViewController_A.m
//  practice_alex_h
//
//  Created by hxw on 2018/7/23.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_ViewController_A.h"
#import "pra_ViewController_B.h"

@interface pra_ViewController_A ()

@end

@implementation pra_ViewController_A

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [self gradientFromColor:[UIColor yellowColor] toColor:[UIColor redColor] withHeight:1000];
    UIButton  * btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 10, 30, 30);
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}




- (void)btnclick
{
    NSLog(@"click A vc");
    
    [self.navigationController pushViewController:[[pra_ViewController_B alloc]init] animated:YES];
    
}
 // 渐变色
- (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height
{
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
