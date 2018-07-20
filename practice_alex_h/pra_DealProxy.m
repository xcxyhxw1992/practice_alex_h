//
//  pra_DealProxy.m
//  practice_alex_h
//
//  Created by hxw on 2018/7/19.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import "pra_DealProxy.h"
#import <objc/runtime.h>

#import "pra_bookProvider.h"
#import "pra_clothesProvider.h"

@interface pra_DealProxy (){
    
    pra_bookProvider * _bookProvider ;
    pra_clothesProvider * _clotheProvider;
    NSMutableDictionary * _methodDic ;
}
@end

@implementation pra_DealProxy

+ (instancetype)shareDealProxy
{
    
    static  pra_DealProxy * proxy = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        proxy =  [pra_DealProxy alloc];
    });
    return proxy;
}

#pragma  mark - init

- (instancetype)init{
    
    _methodDic = [NSMutableDictionary dictionary];
    _bookProvider = [[pra_bookProvider alloc] init];
    _clotheProvider = [[pra_clothesProvider alloc] init];
    
    // 映射target方法列表
    
    
    return self ;
}


#pragma mark  -- private mathod

- (void)_registerMethodWithTarget:(id)target{
    
    unsigned int numberOfMethods = 0 ;
    
    Method * method_list = class_copyMethodList([target class], &numberOfMethods);
    
    for (NSInteger i = 0; i < numberOfMethods; i++) {
        
        // 获取方法名并存字典
        Method tem_method = method_list[i];
        
        SEL tem_sel = method_getName(tem_method);
        
        const char *  tem_method_name = sel_getName(tem_sel);
        
        [_methodDic setObject:target forKey:[NSString stringWithUTF8String:tem_method_name]];
        
    }
    free(method_list);
}


#pragma  mark  -NSporxy override methods

- (void)forwardInvocation:(NSInvocation *)invocation
{
    // 选择当前选择子方法
    
    SEL sel = invocation.selector;
    
    //获取选择子方法名
    
    NSString * methodName = NSStringFromSelector(sel);
    
    //在字典中查找taget
    id  target =  _methodDic [methodName];
    
    //检查target
    if (target && [target respondsToSelector:sel]) {
        [invocation invokeWithTarget:target];
    }else
    {
        [super  forwardInvocation:invocation];
    }
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSString * methodName  = NSStringFromSelector(sel);
    
    id target = _methodDic [methodName];
    
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    }else
    {
        return [super methodSignatureForSelector:sel];
    }
}

@end
