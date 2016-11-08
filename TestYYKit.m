//
//  TestYYKit.m
//  Test
//
//  Created by 李伟 on 16/11/7.
//  Copyright © 2016年 TFLH. All rights reserved.
//
#import <YYKit/YYKit.h>
#import <YYKit/UIColor+YYAdd.h>
#import <YYKit/UIFont+YYAdd.h>
#import "TestYYKit.h"
#import <YYKit/YYTextAttribute.h>
#import <YYKit/YYLabel.h>
#import <YYKit/YYTextView.h>
#import <YYKit/NSAttributedString+YYText.h>
@interface TestYYKit ()
@property(nonatomic,strong)YYLabel *yylabel;
@end

@implementation TestYYKit

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self UI];
}
-(void)UI{

  //  self.yylabel = [[YYLabel alloc]initWithFrame:CGRectMake(90, 90, 150, 20)];
    YYLabel *label = [YYLabel new];
    label.frame = CGRectMake(100, 100, 100, 25);
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.lineBreakMode = 0;
    label.numberOfLines = NSLineBreakByWordWrapping;
    label.text = @"YYTextDemo Test";
    [self.view addSubview:label];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla..."];
    text.font = [UIFont boldSystemFontOfSize:13.0f];
    text.color = [UIColor blueColor];
    [text setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
    
    
    YYLabel *attributedLabel = [YYLabel new];
    attributedLabel.frame = CGRectMake(100, 200, 160, 25);
    attributedLabel.attributedText = text;
    attributedLabel.userInteractionEnabled = YES;
    attributedLabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:attributedLabel];
    
    //高亮字符串 包含点击事件
    {
        [text setTextHighlightRange:NSMakeRange(0, 4)
                                 color:[UIColor orangeColor]
                       backgroundColor:[UIColor whiteColor]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                 NSLog(@"tap text range:...");
                             }];
        
    }
    
    YYLabel *heightRangeLabel = [YYLabel new];
    heightRangeLabel.frame = CGRectMake(100, 250, 160, 25);
    heightRangeLabel.attributedText = text;
    heightRangeLabel.userInteractionEnabled = YES;
    heightRangeLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:heightRangeLabel];
    
    
    //图文混排模式
    NSMutableAttributedString *textImage = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    
    {
        NSString *title = @"图文混排,图片必须满足64位:";
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UIImage *image = [UIImage imageNamed:@"2.jpg"];
        image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:UIImageOrientationUp];
        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [textImage appendAttributedString:attachText];
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    
    
    {
        NSString *title = @"text 与 UIView混排：";
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UISwitch *switcher = [UISwitch new];
        switcher.frame= CGRectMake(0, 0, 50, 50);
        [switcher sizeToFit];
        
        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:switcher contentMode:UIViewContentModeCenter attachmentSize:switcher.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [textImage appendAttributedString:attachText];
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    
    {
        NSString *title = @"text 与 UIImageView混排：";
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
        
        UIImageView *imageView = [UIImageView new];
        imageView.frame= CGRectMake(0, 0, 20, 20);
        [imageView setImage:[UIImage imageNamed:@"5.jpg"]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.frame.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [textImage appendAttributedString:attachText];
        [textImage appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
    }
    
    
    {
        [textImage setTextHighlightRange:NSMakeRange(0, 8)
                                      color:[UIColor orangeColor]
                            backgroundColor:[UIColor whiteColor]
                                  tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                                      NSLog(@"tap text range:...");
                                  }];
        
    }
    
    textImage.font = font;
    YYLabel *textImageLabel = [YYLabel new];
    textImageLabel.userInteractionEnabled = YES;
    textImageLabel.numberOfLines = 0;
    textImageLabel.frame = CGRectMake(100, 280, 250, 200);
    textImageLabel.attributedText = textImage;
    [self.view addSubview:textImageLabel];
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
