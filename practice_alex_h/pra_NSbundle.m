//
//  pra_NSbundle.m
//  practice_alex_h
//
//  Created by hxw on 2018/8/3.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_NSbundle.h"

@implementation pra_NSbundle

void printMainbule(void){
    
    NSBundle * mainBundle = [NSBundle mainBundle];
    NSString * bubdlepath =  [mainBundle bundlePath];
    NSString * resourcePath  = [mainBundle resourcePath];
    NSLog(@"mainBundle :%@",mainBundle);
    NSLog(@"bundlePath : %@",bubdlepath);
    NSLog(@"resourcePath : %@",resourcePath);
}

void printCachePathType(void){
    
    //document路径
    NSString * docunmentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] ;
    NSLog(@"documentpath is     %@",docunmentPath);
    
    //library路径
    NSString * libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    NSLog(@"libaraypath is     %@",libraryPath);
    // preferences 路径
    NSString * libraryPreferencePath = [libraryPath stringByAppendingString:@"/preferences"];
    
    NSLog(@"libraryPreferencePath is %@",libraryPreferencePath);
    //cache路径
    NSString * libraryCachePath =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    NSLog(@"libraryCachePath is %@",libraryCachePath);
    
    //tem文件路径
    NSString *  tem =  NSTemporaryDirectory();
    NSLog(@"temparh is %@", tem);
    
    //home 路径
    NSString * homepath =NSHomeDirectory();
    
    NSLog(@"homePath is %@",homepath);
    
    NSString * strapth =  [docunmentPath stringByAppendingString:@"/str"];
    
    [libraryCachePath writeToFile:strapth atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString * str = [NSString stringWithContentsOfFile:strapth encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"str is %@",str);
    
    NSFileManager * man = [NSFileManager defaultManager];
    
    if ([man  fileExistsAtPath:strapth]) {
        NSError * Error ;
        [man removeItemAtPath:strapth error:&Error];
        
        if (!Error) {
            NSLog(@"succeed");
        }
    }
    NSString * str1 = [NSString stringWithContentsOfFile:strapth encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"str is %@",str1);
}

@end
