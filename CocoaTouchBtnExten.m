//
//  CocoaTouchBtnExten.m
//  Test
//
//  Created by 李伟 on 16/11/2.
//  Copyright © 2016年 TFLH. All rights reserved.
//
#import "RightPanBack.h"
#import "CocoaTouchBtnExten.h"
#import "UIButton/UIButtonHeader.h"
#import "UIButton/UIButton+Block.h"
#import "UIButton/UIButton+CountDown.h"
#import "UIButton/UIButton+Indicator.h"
#import "UIButton/UIButton+LXMImagePosition.h"
#import "UIButton/UIButton+MiddleAligning.h"
#import "UIButton/UIButton+Submitting.h"
#import "UIButton/UIButton+TouchAreaInsets.h"
#import "NSBundle/NSBundle+JKAppIcon.h"
@implementation CocoaTouchBtnExten

- (void)viewDidLoad {

    [super viewDidLoad];
    [self testCocoaBtnBlock];
}

- (void)testCocoaBtnBlock {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(20, 90, 300, 30)];
       btn.layer.borderColor = [UIColor cyanColor].CGColor;
    btn.layer.borderWidth =1.0;
    btn.tag = 1000;
    [btn setBackgroundColor:[UIColor cyanColor]];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"重新获取" forState:UIControlStateNormal];
    //__weak typeof(btn) weakBtn = btn;
    [btn addActionHandler:^(NSInteger tag) {
        NSLog(@"run_time_block");
   //     [weakBtn startTime:3 title:@"重新获取" waitTittle:@"重新获取"];
    }];
   
 //   [btn startTime:6 title:@"获取验证码" waitTittle:@"重新获取"];
 //[btn sizeToFit];
    [self.view addSubview:btn];
//    [btn showIndicator];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [btn hideIndicator];
//    });
    [btn setImage:[UIImage imageNamed:@"hor.png"] forState:UIControlStateNormal];
    //[btn setImagePosition:LXMImagePositionRight spacing:80];
    
   // [btn middleAlignButtonWithSpacing:30];
  //  [btn beginSubmitting:@"登录中...."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [btn endSubmitting];
//    });
    //[btn setTouchAreaInsets:UIEdgeInsetsMake(50, 10, 50, 10)];
    btn.touchAreaInsets = UIEdgeInsetsMake(10, 0, 10, 0);
//   NSString *iconP = [[[NSBundle alloc]init] jk_appIconPath];
//    
//    NSDictionary *result = [[NSBundle mainBundle] infoDictionary];
//    
//    NSLog(@"<result>%@",result);
//    NSLog(@"%@",iconP);
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

     [self.navigationController pushViewController:[[RightPanBack alloc] init] animated:YES]; 
}

@end
