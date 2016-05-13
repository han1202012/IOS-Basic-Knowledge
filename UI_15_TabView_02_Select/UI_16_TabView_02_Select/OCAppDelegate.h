//
//  OCAppDelegate.h
//  UI_16_TabView_02_Select
//
//  Created by octopus on 16-4-15.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//下面的两个数组是 UITabView 的两个数据源, 整个应用都共享的数据定义的 APPDelegate 类中
@property (strong, nonatomic) NSMutableArray * stations;
@property (strong, nonatomic) NSMutableArray * lines;

@end
