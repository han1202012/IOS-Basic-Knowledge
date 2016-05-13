//
//  OCEditViewController.h
//  UI_16_TabView_02_Select
//
//  Created by octopus on 16-4-15.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCAppDelegate.h"
#import "OCViewController.h"

@interface OCEditViewController : UIViewController

//地铁站对应的 输入框
@property (strong, nonatomic) IBOutlet UITextField *stationTextField;

//线路对应的输入框
@property (strong, nonatomic) IBOutlet UITextField *lineTextField;

//两个输入框的输入完成事件对应的方法
//中间出了一些小波折, IBAction 绑定了错误的事件, 没有删除之前的事件绑定
//产出事件绑定方法 : 在 storyboard 中打开左侧的 View Control Scence, 然后右键点击 View Controller, 删除无用的绑定
- (IBAction)finishEditTextField:(id)sender;

//点击按钮回调的方法
- (IBAction)clickButton:(id)sender;

//正在编辑的表格行
@property (strong, nonatomic) NSIndexPath * index;

@end
