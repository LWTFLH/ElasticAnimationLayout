//
//  ReplayKitViewController.m
//  Test
//
//  Created by 李伟 on 16/11/8.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "ReplayKitViewController.h"
#import <ReplayKit/ReplayKit.h>
@interface ReplayKitViewController () <RPPreviewViewControllerDelegate>
- (IBAction)startRecord:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *animationImageView;
@property (nonatomic, strong) RPScreenRecorder *screenRecoder;
@end

@implementation ReplayKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animationImageView.layer.masksToBounds = YES;
    self.animationImageView.layer.cornerRadius = self.animationImageView.frame.size.width / 2.0;
    self.animationImageView.animationImages = @[
        [UIImage imageNamed:@"5.jpg"],
        [UIImage imageNamed:@"7.jpg"],
        [UIImage imageNamed:@"green.jpg"],
        [UIImage imageNamed:@"icon.jpg"],
        [UIImage imageNamed:@"私人定制logo-120@2x-1.png"]
    ];
    [self.animationImageView startAnimating];
}
#pragma mark RPPreviewViewController delegate
- (void)previewController:(RPPreviewViewController *)previewController
didFinishWithActivityTypes:(NSSet<NSString *> *)activityTypes {

    for (NSString *type in activityTypes) {
        NSLog(@"<用户回调录制操作>%@", type);
    }
}

- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController {

    NSLog(@"显示完毕");
    [previewController dismissViewControllerAnimated:YES
                                          completion:^{
                                              NSLog(@"dismiss");
                                          }];
}

- (IBAction)startRecord:(UIButton *)sender {

    if (sender.isSelected) {
        [[RPScreenRecorder sharedRecorder]
        stopRecordingWithHandler:^(RPPreviewViewController *_Nullable previewViewController, NSError *_Nullable error) {
            if (error) {
                NSLog(@"%@", error);
            }
            if (previewViewController) {
                previewViewController.previewControllerDelegate = self;
                [self presentViewController:previewViewController animated:YES completion:nil];
            }
        }];
        sender.selected = NO;
        return;
    }
    if ([RPScreenRecorder sharedRecorder].available) {
        NSLog(@"OK");
        sender.selected = YES;
        [[RPScreenRecorder sharedRecorder] startRecordingWithMicrophoneEnabled:YES
                                                                       handler:^(NSError *_Nullable error) {
                                                                           NSLog(@"%@", error);
                                                                       }];
    } else {
        NSLog(@"录制回放功能不可用");
    }
}
@end
