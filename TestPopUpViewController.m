//
//  TestPopUpViewController.m
//  Test
//
//  Created by 李伟 on 16/11/4.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "TestPopUpViewController.h"
#import <Masonry/Masonry.h>
#import <KLCPopup/KLCPopup.h>
@interface TestPopUpViewController ()

@end

@implementation TestPopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UI];
}
-(void)UI{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bz.jpg"]];
    UIView *contentVie = [[UIView alloc]init];
    contentVie.clipsToBounds  =YES;
    contentVie.backgroundColor = [UIColor colorWithRed:.3 green:.5 blue:.8 alpha:1];
    contentVie.layer.cornerRadius  =10;
    
    [self.view addSubview:contentVie];
  
    KLCPopup *pop = [KLCPopup popupWithContentView:contentVie];
    pop.layer.borderColor = [UIColor redColor].CGColor;
    pop.layer.borderWidth = 1.0;
    pop.maskType = KLCPopupMaskTypeDimmed;
    pop.showType = KLCPopupShowTypeBounceInFromTop;
    pop.dimmedMaskAlpha = 1;

    [self.view addSubview:pop];
    
    
    
    UILabel *title = [[UILabel alloc]init];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor cyanColor];
    title.text = @"Hi";
    title.font = [UIFont boldSystemFontOfSize:30];
    [contentVie addSubview:title];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn.layer.borderColor = [UIColor purpleColor].CGColor;
    btn.layer.borderWidth = 1.0;
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    btn.layer.shadowOpacity= .8;
    [contentVie addSubview:btn];
    
    [contentVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 150));
        
    }];
    
    [pop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 150));
        make.center.mas_equalTo(self.view);
    
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.mas_equalTo(contentVie).offset(0);
        make.trailing.mas_equalTo(contentVie).offset(0);
        make.top.mas_equalTo(contentVie).offset(0);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(contentVie).offset(0);
        make.leading.mas_equalTo(contentVie).offset(0);
        make.trailing.mas_equalTo(contentVie).offset(0);
    }];
    
    [pop show];
   // [pop showAtCenter:self.view.center inView:self.view withDuration:MAXFLOAT];
    
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
