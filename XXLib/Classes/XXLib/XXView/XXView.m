//
//  XXView.m
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXView.h"

@implementation XXView

+ (instancetype)xx_createViewSuperView:(UIView *)superView {
    return [self xx_createViewFrame:CGRectZero superView:superView];
}

+ (instancetype)xx_createViewFrame:(CGRect)frame superView:(UIView *)superView {
    XXView *view = [[XXView alloc] initWithFrame:frame];
    view.viewSupView(superView);
    return view;
}

- (XXView *(^)(UIView *))viewSupView {
    return ^XXView *(UIView *superView) {
        if (superView) {
            [superView addSubview:self];
        }
        return self;
    };
}

- (XXView *(^)(UIColor *))viewBackgroundColor {
    return ^XXView *(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (XXView *(^)(CGFloat))viewCornerRadius {
    return ^XXView *(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

@end
