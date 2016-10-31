//
//  RightPanBack.m
//  Test
//
//  Created by 李伟 on 16/10/31.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "MONActivityIndicatorView/MONActivityIndicatorView.h"
#import "RightPanBack.h"
@interface RightPanBack () <MONActivityIndicatorViewDelegate>
@property (nonatomic, strong) MONActivityIndicatorView *indicator;
@end

@implementation RightPanBack
- (MONActivityIndicatorView *)indicator {

    if (!_indicator) {
        _indicator = [[MONActivityIndicatorView alloc] init];
        _indicator.center = self.view.center;
        _indicator.delegate = self;
    }
    return _indicator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UISwitch alloc] init];
    // self.view.backgroundColor = [UIColor cyanColor];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    UIBarButtonItem *left =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = left;
    [self customerIndicator];
}
#pragma mark  indicator delegate
-(UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView circleBackgroundColorAtIndex:(NSUInteger)index{

    
    CGFloat red = arc4random()%256/255.0;
    CGFloat green = arc4random()%256/255.0;
    CGFloat blue = arc4random()%256/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
}

-(NSString *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView circleTextAtIndex:(NSUInteger)index{

    if (index ==0) {
        return @"哈哈";
    }else if (index == 1){
    
        return @"变色";
    }
    return @"其它";
    
}
- (void)customerIndicator {

    // self.indicator.center  = self.view.center;
    [self.view addSubview:self.indicator];
    [self.indicator startAnimating];
}
- (void)showLWIndicator {

    MONActivityIndicatorView *indicatorView = [[MONActivityIndicatorView alloc] init];
    // indicatorView.delegate = self;
    indicatorView.numberOfCircles = 3;
    indicatorView.radius = 20;
    indicatorView.internalSpacing = 3;
    indicatorView.duration = 0.5;
    indicatorView.delay = 0.5;
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    [indicatorView startAnimating];
}

- (void)back:(UIBarButtonItem *)item {

    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"back");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
