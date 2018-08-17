//
//  pra_MCustom_View.m
//  practice_alex_h
//
//  Created by hxw on 2018/8/8.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_MCustom_View.h"
@implementation pra_MCustom_View


+ (void)viewAddedInSuperView:(UIView* )superview{

    UIImageView * bacImagView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    bacImagView.image = [UIImage imageNamed:@"ed662587bd"];
    bacImagView.image = [self coreBlurImage:[UIImage imageNamed:@"ed662587bd"] withBlurNumber:0.1f];
    
    //毛玻璃  ios 10 and newer
    if (@available(iOS 10.0 , *)) {
        UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = CGRectMake(0, 0, 160, 500);
        [bacImagView addSubview:effectView];
        
         UIOffsetMake(<#CGFloat horizontal#>, <#CGFloat vertical#>)
        
        if (!superview) {
            return ;
        }else
        {
            [superview addSubview:bacImagView];
        }
    }
}

+(UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage= [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey]; [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}


@end
