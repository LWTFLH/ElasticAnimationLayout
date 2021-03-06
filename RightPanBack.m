//
//  RightPanBack.m
//  Test
//
//  Created by 李伟 on 16/10/31.
//  Copyright © 2016年 TFLH. All rights reserved.
//
#import "MONActivityIndicatorView/MONActivityIndicatorView.h"
#import "RightPanBack.h"
#import "UIView+Blur.h"
#import "UIView+GestureCallback.h"
#import "UIView+Shake.h"
@interface RightPanBack () <MONActivityIndicatorViewDelegate>
@property (nonatomic, strong) MONActivityIndicatorView *indicator;
@property (nonatomic, strong) UIButton *tempBtn;
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
  //  [self allFonts];
  //  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green.jpg"]];
    self.navigationItem.titleView = [[UISwitch alloc] init];
    // self.view.backgroundColor = [UIColor cyanColor];
  //  self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    //self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    UIBarButtonItem *left =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = left;
    //  [self customerIndicator];
    //[self time];

 //   [self addBtn];
 //   [self blur];

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view enableBlur:NO];
//    });
}
- (void)blur {

    self.view.blurTintColor = [UIColor lightGrayColor];
    self.view.blurStyle = UIViewBlurDarkStyle;
    [self.view enableBlur:YES];

    //  [self.view addSubview:self.view.blurBackground];
}

- (void)addBtn {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"click shake" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(90, 90, 180, 20)];
    [btn sizeToFit];
    [self.view addSubview:btn];

    self.tempBtn = btn;
}

- (void)click:(UIButton *)btn {

    NSLog(@"click");
}
#pragma mark indicator delegate
- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index {

    CGFloat red = arc4random() % 256 / 255.0;
    CGFloat green = arc4random() % 256 / 255.0;
    CGFloat blue = arc4random() % 256 / 255.0;

    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (NSString *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView circleTextAtIndex:(NSUInteger)index {

    if (index == 0) {
        return @"同";
    } else if (index == 1) {

        return @"牛";
    } else if (index == 2) {

        return @"科";
    } else if (index == 3) {

        return @"技";
    }
    return @"！";
}
- (void)customerIndicator {

    // self.indicator.center  = self.view.center;
    [self.view addSubview:self.indicator];
    [self.indicator startAnimating];
    [self lwSetAllViewFont];
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [self.indicator stopAnimating];
    //    });

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 90, 200, 20)];
    label.text = @"兰亭雅黑是否收发文发嘎嘎";
    label.font = [UIFont fontWithName:@"FZLTHK--GBK1-0" size:[[label font] pointSize]];
    [self.view addSubview:label];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 150, 200, 20)];
    label2.text = @"是否收发文发嘎嘎";
    //  label2.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label2];
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
#pragma mark life cycle
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
  //  [self lwTestGesture];
    
}
#pragma mark 测试封装后的手势代码块
-(void)lwTestGesture{
    
 NSString *str =  [self.view addSwipeGestureRecognizer:^(UISwipeGestureRecognizer *recognizer, NSString *gestureId) {
     
     NSLog(@"%@\n,%@\n",recognizer,gestureId);
    } direction:UISwipeGestureRecognizerDirectionLeft];
    NSLog(@"<result>%@",str);
    //
    [self.view addTapGestureRecognizer:^(UITapGestureRecognizer *recognizer, NSString *gestureId) {
        NSLog(@"%@\n\n%@ ",recognizer,gestureId);
    } numberOfTapsRequired:1 numberOfTouchesRequired:1];
    //
    [self.view addPinchGestureRecognizer:^(UIPinchGestureRecognizer *recognizer, NSString *gestureId) {
        NSLog(@"%@\n\n%@",recognizer,gestureId);
    }];
    
    //
    [self.view addRotationGestureRecognizer:^(UIRotationGestureRecognizer *recognizer, NSString *gestureId) {
        NSLog(@"%@\n\n%@",recognizer,gestureId);
    }];
    
    
    
}



//-(void)time{
//    __block int i= 0;
//    CFAbsoluteTime   interval =1.0;
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //dispatch_queue_t queue2 = dispatch_queue_create(nil, DISPATCH_QUEUE_SERIAL);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0);
//    dispatch_source_set_event_handler(_timer, ^{
//
//        NSLog(@"==============%d",i++);
//
//    });
//    dispatch_resume(_timer);
////    dispatch_main();
//}

- (void)allFonts {

    for (NSString *fontfamilyname in [UIFont familyNames]) {
        NSLog(@"family:'%@'", fontfamilyname);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname]) {
            NSLog(@"\tfont:'%@'", fontName);
        }
        NSLog(@"-------------");
    }
}
- (void)lwSetAllViewFont {
    //   1.在每个控制器里添加这个方法，，，   2.。所有的控制器继承一个父类，在父类实现。
    //  你试下
    [self setFontFamily:@"FZLanTingHei-R-GBK" forView:self.view andSubViews:YES];
}
- (void)setFontFamily:(NSString *)fontFamily forView:(UIView *)view andSubViews:(BOOL)isSubViews {
    if ([view isKindOfClass:[UILabel class]]) { //  在这里判断，对想要改变的控件修改字体
        UILabel *lbl = (UILabel *)view;
        [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
    }
    if (isSubViews) {
        for (UIView *sview in view.subviews) {
            [self setFontFamily:fontFamily forView:sview andSubViews:YES];
        }
    }
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
