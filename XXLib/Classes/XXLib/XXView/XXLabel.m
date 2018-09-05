//
//  XXLabel.m
//  XXKit
//
//  Created by R on 2018/5/8.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXLabel.h"

@implementation XXLabel

+ (instancetype)xx_createLabelSupView:(UIView *)supView {
    return [self xx_createLabelFrame:CGRectZero text:nil supView:supView];
}

+ (instancetype)xx_createLabelFrame:(CGRect)frame text:(NSString *)text supView:(UIView *)supView {
    XXLabel *label = [[XXLabel alloc] initWithFrame:frame];
    label.labText(text);
    label.labSupView(supView);
    return label;
}

- (XXLabel *(^)(NSString *))labText {
    return ^XXLabel *(NSString * text) {
        self.text = text;
        return self;
    };
}

- (XXLabel *(^)(CGFloat))labFont {
    return ^XXLabel *(CGFloat font) {
        self.font = [UIFont systemFontOfSize:font];
        return self;
    };
}

- (XXLabel *(^)(UIColor *))labTextColor {
    return ^XXLabel *(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (XXLabel *(^)(UIColor *))labBackgroundColor {
    return ^ XXLabel *(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (XXLabel *(^)(NSInteger))labNumberOfLines {
    return ^XXLabel *(NSInteger lines) {
        self.numberOfLines = lines;
        return self;
    };
}

- (XXLabel *(^)(NSTextAlignment))labTextAlignment {
    return ^XXLabel *(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

- (XXLabel *(^)(CGFloat))labCornerRadius {
    return ^XXLabel *(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (XXLabel *(^)(UIView *))labSupView {
    return ^XXLabel *(UIView *supView) {
        if (supView) {
            [supView addSubview:self];
        }
        return self;
    };
}

- (XXLabel *(^)(CGRect))labFrame {
    return ^XXLabel *(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

@end
