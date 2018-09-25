//
//  UIView+Empty.m
//  test
//
//  Created by R on 2018/8/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "UIView+Empty.h"

#define LABEL_TAG 123456789
#define IMGVIEW_TAG 987654321

@implementation UIView (Empty)

- (void)showEmptyViewWithImageName:(NSString *)imageName showResult:(BOOL)result {
    UIImageView *imgView = (UIImageView *)[self viewWithTag:IMGVIEW_TAG];
    if (result) {
        if (!imgView) {
            UIImage *image = [UIImage imageNamed:imageName];
            imgView = [self emptyImageViewWithImage:image];
            imgView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            imgView.center = CGPointMake(self.frame.size.width/2., self.frame.size.height/2.);
            [self addSubview:imgView];
        }
    } else {
        if (imgView) {
            [imgView removeFromSuperview];
        }
    }
}

- (void)showEmptyViewWithText:(NSString *)text showResult:(BOOL)result {
    UILabel *label = (UILabel *)[self viewWithTag:LABEL_TAG];
    if (result) {
        if (!label) {
            label = [self emptyLabelWithText:text];
            label.frame = self.bounds;
            [self addSubview:label];
        }
    } else {
        if (label) {
            [label removeFromSuperview];
        }
    }
}

- (void)showEmptyViewWithImageName:(NSString *)imageName text:(NSString *)text showResult:(BOOL)result {
    UIImageView *imgView = (UIImageView *)[self viewWithTag:IMGVIEW_TAG];
    UILabel *label = (UILabel *)[self viewWithTag:LABEL_TAG];
    if (result) {
        if (!imgView) {
            UIImage *image = [UIImage imageNamed:imageName];
            imgView = [self emptyImageViewWithImage:image];
            imgView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            imgView.center = CGPointMake(self.frame.size.width/2., self.frame.size.height/2.);
            [self addSubview:imgView];
        }
        if (!label) {
            label = [self emptyLabelWithText:text];
            label.frame = CGRectMake(20, CGRectGetMaxY(imgView.frame), self.frame.size.width - 40, 30);
            [self addSubview:label];
        }
    } else {
        if (label) {
            [label removeFromSuperview];
        }
        if (imgView) {
            [imgView removeFromSuperview];
        }
    }
}

- (UILabel *)emptyLabelWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.tag = LABEL_TAG;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    return label;
}

- (UIImageView *)emptyImageViewWithImage:(UIImage *)image {
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.tag = IMGVIEW_TAG;
    return imgView;
}

@end
