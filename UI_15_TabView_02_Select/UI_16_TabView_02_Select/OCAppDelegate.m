//
//  OCAppDelegate.m
//  UI_16_TabView_02_Select
//
//  Created by octopus on 16-4-15.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import "OCAppDelegate.h"

@implementation OCAppDelegate

//告知 Delegate 启动进程已完成, app 将要启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 应用启动后执行的操作, 此处是定制的覆盖点
    
    self.stations = [NSMutableArray arrayWithObjects:@"天安门东", @"西二旗", @"六道口", @"生命科学园", nil];
    self.lines = [NSMutableArray arrayWithObjects:@"一号线", @"十三号线", @"十五号线", @"昌平线", nil];
    
    return YES;
}

// 应用将要进入后台
- (void)applicationWillResignActive:(UIApplication *)application
{
}

// 应用已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

// 应用将要进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

// 应用已经进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

// 应用将要终止
- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
