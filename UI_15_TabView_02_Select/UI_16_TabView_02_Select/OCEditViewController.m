//
//  OCEditViewController.m
//  UI_16_TabView_02_Select
//
//  Created by octopus on 16-4-15.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import "OCEditViewController.h"

@interface OCEditViewController ()

@end

@implementation OCEditViewController

//应用委托对象
OCAppDelegate * delegate;
//当前编辑的行号
NSUInteger row;

//View 加载到内存后回调的方法
- (void)viewDidLoad
{
    [super viewDidLoad];
}

//接收到内存报警后回调的方法
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//View 将要显示的时候回调的方法
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //获取应用委托对象, 先获取应用单例实例对象, 然后从单例对象中获取委托对象
    delegate = [UIApplication sharedApplication].delegate;
    
    //获取正在操作的表格行的行号, 该行号是直接设置在 ViewController 类中的
    row = self.index.row;
    
    //设置地铁站编辑框的原始文本
    self.stationTextField.text = [delegate.stations objectAtIndex:row];
    
    //设置地铁线路编辑框显示的原始文本
    self.lineTextField.text = [delegate.lines objectAtIndex:row];
    
    
}

//设置输入框的小键盘, 点击 return 后小键盘消失
- (IBAction)finishEditTextField:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)clickButton:(id)sender
{
    //将编辑后的 地铁站 站名 设置到 OCAppDelegate 单例实例中的 stations 数组中的对应元素中
    //NSArray - replaceObjectAtIndex 方法解析 : 使用 参数二 替换 数组中的 指定索引的元素
    [delegate.stations replaceObjectAtIndex:row withObject:self.stationTextField.text];
    
    //将编辑后的 地铁线路 名称 设置到 OCAppDelegate 单例实例中的 lines 数组中的对应元素中
    [delegate.lines replaceObjectAtIndex:row withObject:self.lineTextField.text];
    
    //界面跳转 步骤一 : 创建要跳转界面的 UIViewController.
    //UIStoryboard - instantiateViewControllerWithIdentifier 方法 :
    //1. 主要作用 : 根据指定的标识 实例化 并 返回 对应的 UIViewController 对象.
    //2. UIViewController 简介 : 使用该方法创建 UIViewController 对象, 该对象就是你想要用编程的方式在你的应用中 操作 和 显示 的界面;
    //3. 先设置标识 Tag : 在使用该方法获取 ViewController 之前, 每次调用前你必须在 Interface Builder 中明确地为 ViewController 设置合适的标识
    //4. 新实例对象 : 该方法每次调用都会创建一个新的 对应指定标识的 UIViewController 实例对象
    OCViewController * controller = [self.storyboard instantiateViewControllerWithIdentifier:@"main"];
    
    //界面跳转 步骤二 : 将显示的界面 设置为 上面创建的 UIViewController 实例对象
    delegate.window.rootViewController = controller;
    
}
@end
