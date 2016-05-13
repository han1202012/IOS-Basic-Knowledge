//
//  OCViewController.m
//  OCTabView
//
//  Created by octopus on 16-1-6.
//  Copyright (c) 2016年 www.octopus.org.cn. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController

/*
    使用了 @synthesize 就可以直接在类中使用 属性变量
    如果没有使用 @synthesize, 那么必须使用 self.属性变量 来访问变量
 */
@synthesize stations;
@synthesize lines;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //车站列表
    stations = [NSArray arrayWithObjects:@"天安门东", @"西二旗", @"六道口", @"生命科学园", nil];
    //线路列表
    lines = [NSArray arrayWithObjects:@"一号线 UITableViewCellStyleDefault", @"十三号线 UITableViewCellStyleSubtitle", @"十五号线 UITableViewCellStyleValue1", @"昌平线 UITableViewCellStyleValue2", nil];
    //设置数据源
    self.tabView.dataSource = self;
    
    //设置 Header 顶部 View 控件
    self.tabView.tableHeaderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_pic.png"]];
    //设置 Footer 底部 View 控件
    self.tabView.tableFooterView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_pic.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

//设置列表中每个条目的控件
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
        UItableView 获取 列表 行 列 信息 方法 : 这些方法都是
        -- cellForRowAtIndexPath 方法 : 获取指定表格行;
        -- indexPathForCell 方法 : 获取表格行 对应的 NSIndexPath 对象;
        -- indexPathForRowsAtPoint 方法 : 返回点所在的 NSIndexPath 对象;
        -- indexPathsForRowsInRect 方法 : 获取指定矩形区域中的所有的 NSIndexPath 组成的数组对象;
        -- visibleCells 方法 : 返回可见的表格元素数组;
        -- indexPathsForVisibleRows 方法 : 返回可见区域对应的 NSIndexPath 元素组成的数组;
     */
    
    
    //表格的标识符 静态字符串
    static NSString * cellId = @"id";
    
    /*
        从 可重用表格行队列中取出 表格行
     
        关于 可重用列表队列 : 当列表中的项目滚动到不可见时, 系统会将不可见的 表格控件 加入到可重用列表队列中, 以便以后可以继续调用, 提高程序性能;
        前提 : 需要 为 UITableViewCell 设置一个 静态的 NSString 的标识;
     */
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    /*
        UITableView 的四种风格
        -- 1. UITableViewCellStyleDefault : 显示 image 和 textLabel 控件, image 在左侧, textLabel 在右侧, 不显示 detailTextLabel 控件;
        -- 2. UITableViewCellStyleSubtitle : 三个控件都显示, image 在左侧, detailTextLabel 在 textLabel 下方, 两个在 image 右侧;
        -- 3. UITableViewCellStyleValue1 : 三个控件都显示, detailTextLabel 淡蓝色, 在 textLabel 右边;
        -- 4. UITableViewCellStyleValue2 : 不显示 image, textLabel 在左侧, 淡蓝色 小, detailTextLabel 在右侧 大;
     */
    
    if(cell == nil){
        switch (indexPath.row) {
            case 0:
                //风格 UITableViewCellStyleDefault
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
                break;
            case 1:
                //风格 UITableViewCellStyleSubtitle
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
                break;
            case 2:
                //风格 UITableViewCellStyleValue1
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
                break;
            case 3:
                //风格 UITableViewCellStyleValue2
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellId];
                break;
                
            default:
                break;
        }
    }
    
    //设置圆角 10 像素
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    
    //获取当前行号
    NSUInteger rowIndex = indexPath.row;
    
    /*
        UITableView 三个可配置属性
        -- 1. textLabel : UILabel 控件, 代表 UITableViewCell 显示的标题;
        -- 2. detailTextLabel : UILabel 控件, 代表 UITableViewCell 显示的详细内容;
        -- 3. image : UIImage 对象, 代表 UITableViewCell 左侧的图标;
     */
    
    //设置表格主要文字
    cell.textLabel.text = [stations objectAtIndex:rowIndex];
    //设置表格图片
    cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    //设置表格 选中时 的图片
    cell.imageView.highlightedImage = [UIImage imageNamed:@"high_icon.png"];
    //设置表格 描述 文字
    cell.detailTextLabel.text = [lines objectAtIndex:rowIndex];
    
    return cell;
}

/*
    设置每列都有多少行, 即每列有多少条目
    每个分区都包含 stations.count 个 条目
 
    关于列 : 如果没有实现 UITableViewDataSource 中的 numberOfSectionsInTableView 方法, 默认有 1 列;
 */
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //列表只有一列, 返回 车站数组的元素个数即可
    return stations.count;
}

@end
