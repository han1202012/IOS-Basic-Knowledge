//
//  OCViewController.h
//  OCTabView
//
//  Created by octopus on 16-1-6.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCViewController : UIViewController <UITableViewDataSource>

//列表控件实例
@property (strong, nonatomic) IBOutlet UITableView *tabView;
//车站数组
@property (strong, nonatomic) NSArray * stations;
//线路数组
@property (strong, nonatomic) NSArray * lines;


@end
