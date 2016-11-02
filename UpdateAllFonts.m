//
//  UpdateAllFonts.m
//  Test
//
//  Created by 李伟 on 16/11/1.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "UpdateAllFonts.h"
#import "UIButton+LWFont.h"
#import "UINavigationItem+Loading.h"

@interface UpdateAllFonts ()
@property(nonatomic,strong)UILabel *testFont;
@end

@implementation UpdateAllFonts

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testUI];
    [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionCenter];
}

//-(void)registerFontChange{
//
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userChangeFont:) name:uifont object:<#(nullable id)#>]
//}
-(void)testUI{
    UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(150, 150, 200, 20)];
    [btn setTitle:@"hi发表哈佛不会吧" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
   // btn.titleLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(90, 90, 200, 50)];
    label.text  =@"二分法覅回复我hi无法label";
      label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    label.textColor = [UIColor cyanColor];
    [self.view addSubview:label];
    
    
    UIImageView *ima = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 100, 100)];
    ima.layer.borderWidth = 1.0;
    ima.backgroundColor = [UIColor orangeColor];
   // ima.layer.borderColor= [UIColor yellowColor].CGColor;
    [self.view addSubview:ima];
    
    
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
