//
//  ViewControllerHUD.m
//  Test
//
//  Created by 李伟 on 16/11/1.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "ViewControllerHUD.h"
#import "UIView+HUD.h"
#import "UIView+Screenshot.h"
@interface ViewControllerHUD ()

@end

@implementation ViewControllerHUD
{

    UIImageView *_snap;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self lwTestHud];
}
-(void)lwTestHud{

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7.jpg"]];
    _snap = [[UIImageView alloc]initWithFrame:CGRectMake(90, 90, 200, 100)];
    [self.view addSubview:_snap];
   // [self.view showLoadFinish];
    
  //  [self.view showLoading:@"拼命加载中..."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view hideHUD];
//    });
    
  //  [self.view showSuccess:@"SUCESS"];
//    [self.view showWaiting];
//    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [weakSelf.view hideHUD];
//    });
 //   [self.view showWaitingWithBackGround];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    _snap.image = [self.view screenshot];
   // UIImageWriteToSavedPhotosAlbum(_snap.image, nil, @selector(imagePickerController:didFinishPickingMediaWithInfo:), nil);
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
