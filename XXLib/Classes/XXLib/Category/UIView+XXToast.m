//
//  UIView+XXToast.m
//  XXKit
//
//  Created by R on 2018/5/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "UIView+XXToast.h"

@implementation UIView (XXToast)

+ (void)xx_showToastOnWindow:(NSString *)message {
    [[self alloc] xx_showToast:message];
}

- (void)xx_showToast:(NSString *)message {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *toastView = [window viewWithTag:1000000];
    if (toastView) {
        NSLog(@"----已存在");
        return;
    }
    UIView *hudView = [[UIView alloc] init];
    hudView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    hudView.layer.cornerRadius = 8;
    hudView.layer.masksToBounds = YES;
    hudView.tag = 1000000;
    
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [hudView addSubview:label];
    CGSize size = [label sizeThatFits:CGSizeMake(260, 9999)];
    label.frame = CGRectMake(10, 0, size.width, size.height+16);
    hudView.frame = CGRectMake(0, 0, size.width + 20, label.frame.size.height);
    
    [window addSubview:hudView];
    hudView.center = window.center;
    
    
    hudView.alpha = 0;
    
    [UIView animateWithDuration:0.5 animations:^{
        hudView.alpha = 1;
    } completion:^(BOOL finished) {
        NSTimeInterval duration = [self displayDurationForString:message];
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:duration];
    }];
}

- (void)dismiss {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    UIView *toastView = [window viewWithTag:1000000];
    [UIView animateWithDuration:0.5 animations:^{
        toastView.alpha = 0;
    } completion:^(BOOL finished) {
        [toastView removeFromSuperview];
    }];
}

- (NSTimeInterval)displayDurationForString:(NSString*)string {
    return MIN((float)string.length*0.06 + 0.5, 3.0);
}

@end
