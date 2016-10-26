//
//  EmptyDataSet.m
//  Test
//
//  Created by 李伟 on 16/10/26.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "EmptyDataSet.h"
#import "DZNEmptyDataSet/Source/UIScrollView+EmptyDataSet.h"
@interface EmptyDataSet ()<UITableViewDataSource,UITableViewDelegate,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>
@property(nonatomic,strong)UITableView *tableSet;
@property(nonatomic,strong)NSArray *data;
@end

@implementation EmptyDataSet
-(NSArray *)data{

    if (!_data) {
        _data = [NSArray array];
    }
    return _data;
}
-(UITableView *)tableSet{

    if (!_tableSet) {
        _tableSet = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableSet registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
        _tableSet.delegate = self;
        _tableSet.dataSource =self;
        _tableSet.emptyDataSetDelegate = self;
        _tableSet.emptyDataSetSource = self;
        _tableSet.tableFooterView = [UIView new];
    }
    return _tableSet;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableSet];

  //  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];

    
    
}

#pragma mark dataSources
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{

    NSAttributedString *string = [[NSAttributedString alloc]initWithString:@"暂无数据"];
    return string;;
}

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
 
    
    return [UIImage imageNamed:@"7.jpg"];
}
#pragma mark
-(BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView{

    return YES;
}
-(CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView{

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    animation.duration = 3;
    animation.cumulative = YES;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}
-(NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{

    
    return [[NSAttributedString alloc]initWithString:@"您还没没有购买记录" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                                                               NSForegroundColorAttributeName: [UIColor darkGrayColor]}
            ];
    
}
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0f],NSForegroundColorAttributeName:[UIColor cyanColor]};
    
    return [[NSAttributedString alloc] initWithString:@"点击刷新" attributes:attributes];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
       return [UIImage imageNamed:@"hor.png"];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    NSLog(@"backgroundColorForEmptyDataSet");
    return [UIColor whiteColor];
}

#if 0
/* 显示等待状态:
 If you need a more complex layout, you can return a custom view instead: */
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    NSLog(@"customViewForEmptyDataSet");
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityView startAnimating];
    
//    UIImageView *temp = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2.jpg"]];
    return activityView;
}
#endif

/* Additionally, you can also adjust the vertical alignment of the content view
 (ie: useful when there is tableHeaderView visible): */
//- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
//{
//    NSLog(@"verticalOffsetForEmptyDataSet");
//    return -self.tableSet.tableHeaderView.frame.size.height/2.0f;
//}


- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    NSLog(@"spaceHeightForEmptyDataSet");
    return 20.0f;
}

#pragma mark ---- Delegate Implementation ----

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    NSLog(@"emptyDataSet允许显示");
    return YES;
}


- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    NSLog(@"emptyDataSet允许交互");
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    NSLog(@"数据集允许滚动");
    return NO;
}

- (BOOL) emptyDataSetShouldAllowImageViewAnimate:(UIScrollView *)scrollView
{
    NSLog(@"允许占位图动画");
    return YES;
}

- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView
{
    NSLog(@"点击空白区域");
    // Do something
}
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView
{
    NSLog(@"点击按钮");
    
    
    self.data = @[@"",@"",@"",@"",@""];
    
    
    [self.tableSet reloadData];
    // Do something
}
#pragma mark tableDataSources
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    UIView *selectView = [[UIView alloc]initWithFrame:self.view.frame];
    selectView.backgroundColor = [UIColor redColor];
    cell.selectedBackgroundView  = selectView;
    
    if (indexPath.row == 1) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 3) {
        cell.selected = YES;
        // 颜色变浅
       // cell.userInteractionEnabled = NO;
    }
    
    if (indexPath.row%2 == 0) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"<第%ld行",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *temp = [tableView cellForRowAtIndexPath:indexPath];
    temp.selected  =NO;
    

    NSLog(@"选中行%ld",indexPath.row);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
