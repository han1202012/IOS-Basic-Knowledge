//
//  OCViewController.h
//  UI_16_TabView_02_Select
//
//  Created by octopus on 16-4-15.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCAppDelegate.h"
#import "OCEditViewController.h"

/*
    实现两个协议
    UITableViewDataSource 协议 : 用于设置 TabView 的数据;
    UITableViewDelegate 协议 :
 */
@interface OCViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tabView;

@end
