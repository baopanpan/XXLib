//
//  XXImageView.m
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXImageView.h"

@implementation XXImageView

+ (instancetype)xx_createImageViewSuperView:(UIView *)superView {
    return [self xx_createImageViewFrame:CGRectZero imageName:nil superView:superView];
}

+ (instancetype)xx_createImageViewSuperView:(UIView *)superView initImageView:(void (^)(XXImageView *))imageViewBlock imageViewTapGesture:(ImageViewTapBlock)block {
    XXImageView *xx_imageView = [self xx_createImageViewSuperView:superView];
    imageViewBlock(xx_imageView);
    [xx_imageView xx_addImageViewTapGesture:^(XXImageView *imageView) {
        block(imageView);
    }];
    return xx_imageView;
}

+ (instancetype)xx_createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName superView:(UIView *)superView {
    XXImageView *imageView = [[XXImageView alloc] initWithFrame:frame];
    imageView.imageName(imageName).imageViewSuperView(superView);
    return imageView;
}

- (XXImageView *(^)(NSString *))imageName {
    return ^XXImageView *(NSString *imageName) {
        if (imageName == nil || imageName.length == 0) {
            return self;
        }
        self.image = [UIImage imageNamed:imageName];
        return self;
    };
}

- (XXImageView *(^)(UIImage *))imageViewImage {
    return ^XXImageView *(UIImage *image) {
        self.image = image;
        return self;
    };
}

- (XXImageView *(^)(NSInteger))imageViewTag {
    return ^XXImageView *(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

- (XXImageView *(^)(UIColor *))imageViewColor {
    return ^XXImageView *(UIColor *color) {
       self.backgroundColor = color;
        return self;
    };
}

- (XXImageView *(^)(CGFloat))imageViewCornerRadius {
    return ^XXImageView *(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

- (XXImageView *(^)(UIView *))imageViewSuperView {
    return ^XXImageView *(UIView *superView) {
        if (superView) {
            [superView addSubview:self];
        }
        return self;
    };
}

- (XXImageView *(^)(CGRect))imageViewFrame {
    return ^XXImageView *(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

- (void)xx_addImageViewTapGesture:(ImageViewTapBlock)imageViewTapBlock {
    self.imageViewTapBlock = imageViewTapBlock;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (void)tapAction {
    if (self.imageViewTapBlock) {
        self.imageViewTapBlock(self);
    }
}

- (void)xx_addImageViewLongPressGesture:(ImageViewTapBlock)imageViewTapBlock {
    self.imageViewTapBlock = imageViewTapBlock;
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureAction:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:longPressGesture];
}

- (void)longPressGestureAction:(UIGestureRecognizer *)ges {
    if (ges.state == UIGestureRecognizerStateBegan) {
        if (self.imageViewTapBlock) {
            self.imageViewTapBlock(self);
        }
    }
}

@end
