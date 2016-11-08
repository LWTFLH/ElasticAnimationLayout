//
//  TestClip.m
//  Test
//
//  Created by 李伟 on 16/11/7.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "TestClip.h"

@interface TestClip ()

@end

@implementation TestClip
{

    UIImageView *fore;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UI];
}
-(void)UI{

    UIImageView *back =[[UIImageView alloc]initWithFrame:CGRectMake(90, 90, 65, 23)];
    back.image = [UIImage imageNamed:@"StarsBackground.png"];
    back.contentMode   =UIViewContentModeLeft;
    back.layer.borderColor = [UIColor greenColor].CGColor;
    back.layer.borderWidth = 1.0;
    [self.view addSubview:back];
   fore = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 65, 32)];
    fore.contentMode = UIViewContentModeLeft;
    fore.image = [UIImage imageNamed:@"StarsForeground.png"];
    [back addSubview:fore];
    fore.clipsToBounds = YES;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGRect frame = fore.frame;
    frame.size.width = 3/5.0*frame.size.width;
    
    fore.frame = frame;
    
    
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
