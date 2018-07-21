//
//  pra_DealProxy.h
//  practice_alex_h
//
//  Created by hxw on 2018/7/19.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pra_bookProvider.h"
#import "pra_clothesProvider.h"

@interface pra_DealProxy : NSProxy <praBookproviderPrototol,pra_clothesProviderProtocol>


+ (instancetype)shareDealProxy ;

@end
