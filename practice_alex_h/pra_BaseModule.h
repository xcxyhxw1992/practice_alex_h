//
//  pra_BaseModule.h
//  practice_alex_h
//
//  Created by hxw on 2018/8/7.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef MoudleProtocol_ServerInterface
#define MoudleProtocol_ServerInterface @"SI"
#endif

@protocol pra_BaseModule <NSObject>
@required
// server body
@property(nonatomic, weak) __kindof UIViewController* serverBody;
@optional
// callback
@property(nonatomic, copy) void (^callback) (id params);
@end

@protocol pra_moduleA<pra_BaseModule>

@required
// input
@property(nonatomic, copy) NSString* name;

@end



