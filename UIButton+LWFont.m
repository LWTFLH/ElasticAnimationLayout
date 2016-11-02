//
//  UIButton+LWFont.m
//  Test
//
//  Created by 李伟 on 16/11/1.
//  Copyright © 2016年 TFLH. All rights reserved.
//

#import "UIButton+LWFont.h"
#import <objc/runtime.h>
@interface UILabel (LWFont)

@end
@implementation UILabel (LWFont)
//+ (void)load {
//
//    Method sysIme = class_getInstanceMethod([self class], @selector(init));
//    Method myIme = class_getInstanceMethod([self class], @selector(myinit));
//
//    method_exchangeImplementations(sysIme, myIme);
//}
//- (id)myinit {
//
//    [self myinit];
//    if (self) {
//        //  to do
//        self.titleLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
//    }
//
//    return self;
//}
//

+ (void)load
{
    Method imp = class_getInstanceMethod([self class], @selector(initWithFrame:));
    Method myImp = class_getInstanceMethod([self class], @selector(myinitwithFrame:));
    method_exchangeImplementations(imp, myImp);
    NSLog(@"================已经加载完毕load");
}

- (id)myinitwithFrame:(CGRect)frame
{
    [self myinitwithFrame:frame];
    if (self) {
     //   CGFloat fontSize = self.titleLabel.font.pointSize;
        self.font = [UIFont systemFontOfSize:8];
        self.tintColor = [UIColor greenColor];
        self.layer.borderColor = [UIColor blueColor].CGColor;
        self.layer.borderWidth  = 5.0;

    }
    NSLog(@"%@",self);
    NSLog(@"================myinit");
    return self;
}

@end
//@implementation UILabel (LWFont)

//+ (void)load
//{
//    Method imp = class_getInstanceMethod([self class], @selector(init));
//    Method myImp = class_getInstanceMethod([self class], @selector(myinit));
//    method_exchangeImplementations(imp, myImp);
//    NSLog(@"=======已经加载完毕==========label");
//}
//
//- (id)myinit
//{
//    [self myinit];
//    if (self) {
//        //   CGFloat fontSize = self.titleLabel.font.pointSize;
//        self.font = [UIFont systemFontOfSize:40];
//    }
//    NSLog(@"myinit");
//    return self;
//}
//@end