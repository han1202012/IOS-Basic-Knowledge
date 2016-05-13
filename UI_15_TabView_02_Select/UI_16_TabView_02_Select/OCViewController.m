//
//  OCViewController.m
//  UI_16_TabView_02_Select
//
//  Created by octopus on 16-4-15.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController

//定义应用程序的委托对象, 即 OCAppDelegate.m 类对应对象
OCAppDelegate * appDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// 执行任何附加的操作, 在从 nib 中加载完这个 View 之后.
    
    // 设置 UITableView 的 UITableViewDataSource (数据源) 和 UITableViewDelegate (事件委托)
    self.tabView.dataSource = self;
    self.tabView.delegate = self;
    
    //获取 OCAppDelegate 对象, 通过调用 UIApplication 方法获取
    appDelegate = [UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // 处理任何可以被重新构造的资源.
}

//
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabView reloadData];
}

//为每个 Cell 获取具体的数据
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableView 表格行的 字符串标识
    static NSString * cell_id = @"cell_id";
    //根据表格行的字符串标识, 返回一个可重用的表格行
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if(cell == nil){
        //创建一个 UITableViewCellStyleSubtitle 风格的表格行
        //风格 : 三个控件都显示, image 在左侧, detailTextLabel 在 textLabel 下方, 两个在 image 右侧
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cell_id];
    }
    
    //参数 (NSIndexPath *)indexPath 中获取当前行号
    NSUInteger rowNumber = indexPath.row;

    //设置主标题
    //NSArray.objectAtIndex : 返回指定索引的图片, 如果索引超出数组边界, 抛出异常
    cell.textLabel.text = [appDelegate.stations objectAtIndex:rowNumber];
  
    //设置圆角
    cell.layer.cornerRadius = 15;
    cell.layer.masksToBounds = YES;
    
    //设置表格行左端图片
    cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    //设置表格行选中时的左端图片
    cell.imageView.highlightedImage = [UIImage imageNamed:@"high_icon.png"];
    //设置副标题 (具体内容)
    cell.detailTextLabel.text = [appDelegate.lines objectAtIndex:rowNumber];
    return cell;
}

//返回每行有多少列
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return appDelegate.stations.count;
}

//列表中的条目被选中后回调的方法
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取应用程序委托对象
    OCAppDelegate * delegate = [UIApplication sharedApplication].delegate;
    
    //获取编辑界面对应的 ViewController
    OCEditViewController * editViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    
    //设置当前正在编辑的表格行行号
    editViewController.index = indexPath;
    
    //界面跳转
    delegate.window.rootViewController = editViewController;
    
}

@end
