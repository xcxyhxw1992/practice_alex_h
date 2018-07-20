//
//  pra_clothesProvider.h
//  practice_alex_h
//
//  Created by hxw on 2018/7/19.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, clothesSize) {
    S,
    XL,
    XXL,
};

@protocol pra_clothesProviderProtocol <NSObject>

- (void)purchaseClothsWithSize:(clothesSize) size ;

@end

@interface pra_clothesProvider : NSObject

@end
