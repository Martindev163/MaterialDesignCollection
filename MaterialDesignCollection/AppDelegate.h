//
//  AppDelegate.h
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/4.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

