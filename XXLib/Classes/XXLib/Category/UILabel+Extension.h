//
//  UILabel+Extension.h
//  demo
//
//  Created by R on 2018/9/5.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

- (void)textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;
- (void)textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)fontSize;
- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize;
- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize fontName:(NSString *)fontName;

@end
