//
//  AppDelegate.h
//  practice_alex_h
//
//  Created by bot on 2018/7/16.
//  Copyright © 2018年 testDemon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface h_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

