//
//  CocoaTouchBtnExten.m
//  Test
//
//  Created by 李伟 on 16/11/2.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "CocoaTouchBtnExten.h"
#import "UIButton/UIButtonHeader.h"
#import "UIButton/UIButton+Block.h"
@implementation CocoaTouchBtnExten

- (void)viewDidLoad {

    [super viewDidLoad];
}

- (void)testCocoaBtnBlock {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(90, 90, 150, 20)];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"block btn" forState:UIControlStateNormal];
    [btn addActionHandler:^(NSInteger tag) {
        NSLog(@"run_time_block");
    }];
    
    
}
@end
