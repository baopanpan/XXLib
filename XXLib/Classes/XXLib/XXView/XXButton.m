//
//  XXButton.m
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXButton.h"

@implementation XXButton

+ (instancetype)xx_createButtonSuperView:(UIView *)superView {
    return [self xx_createButtonFrame:CGRectZero title:nil superView:superView];
}

+ (instancetype)xx_createButtonSuperView:(UIView *)superView initButton:(void (^)(XXButton *button))initBlock buttonClick:(ButtonClickBlock)block {
    XXButton *button = [self xx_createButtonFrame:CGRectZero title:nil superView:superView];
    initBlock(button);
    [button xx_addButtonClick:^(XXButton *button) {
        block(button);
    }];
    return button;
}

+ (instancetype)xx_createButtonFrame:(CGRect)frame title:(NSString *)title superView:(UIView *)superView {
    XXButton *button = [XXButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.btnNormalTitle(title).btnNormalTitleColor([UIColor blackColor]).btnSuperView(superView);
    return button;
}

- (XXButton *(^)(NSString *))btnNormalTitle {
    return ^XXButton *(NSString *title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (XXButton *(^)(NSString *))btnSelectTitle {
    return ^XXButton *(NSString *title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
}

- (XXButton *(^)(NSString *))btnNormalImageName {
    return ^XXButton *(NSString *image) {
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        return self;
    };
}

- (XXButton *(^)(NSString *))btnSelectImageName {
    return ^XXButton *(NSString *image) {
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateSelected];
        return self;
    };
}

- (XXButton *(^)(NSString *))btnNormalBackgroundImageName {
    return ^XXButton *(NSString *image) {
        [self setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        return self;
    };
}

- (XXButton *(^)(NSString *))btnSelectBackgroundImageName {
    return ^XXButton *(NSString *image) {
        [self setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateSelected];
        return self;
    };
}

- (XXButton *(^)(UIColor *))btnBackgroundColor {
    return ^XXButton *(UIColor *color) {
        [self setBackgroundColor:color];
        return self;
    };
}

- (XXButton *(^)(UIColor *))btnNormalTitleColor {
    return ^XXButton *(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (XXButton *(^)(UIColor *))btnSelectTitleColor {
    return ^XXButton *(UIColor *color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}

- (XXButton *(^)(NSInteger))btnTag {
    return ^XXButton *(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

- (XXButton *(^)(CGFloat))btnFont {
    return ^XXButton *(CGFloat font) {
        self.titleLabel.font = [UIFont systemFontOfSize:font];
        return self;
    };
}

- (XXButton *(^)(CGFloat))btnCornerRadius {
    return ^XXButton *(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (XXButton *(^)(UIColor *))btnBorderColor {
    return ^XXButton *(UIColor *color) {
        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (XXButton *(^)(CGFloat))btnBorderWidth {
    return ^XXButton *(CGFloat width) {
        self.layer.borderWidth = width;
        return self;
    };
}

- (XXButton *(^)(UIView *))btnSuperView {
    return ^XXButton *(UIView *superView) {
        if (superView) {
            [superView addSubview:self];
        }
        return self;
    };
}

- (XXButton *(^)(CGRect))btnFrame {
    return ^XXButton *(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

- (void)xx_addButtonClick:(ButtonClickBlock)block {
    self.buttonClickBlock = block;
    [self addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick:(id)sender {
    if (!self.isSoonClick) {
        self.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.userInteractionEnabled = YES;
        });
    }
    if (self.buttonClickBlock) {
        self.buttonClickBlock(self);
    }
}

@end
