//
//  XXView.h
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXView : UIView

@property (nonatomic, readonly ,copy) XXView *(^viewSupView)(UIView *);
@property (nonatomic, readonly ,copy) XXView *(^viewBackgroundColor)(UIColor *color);
@property (nonatomic, readonly ,copy) XXView *(^viewCornerRadius)(CGFloat radius);

+ (instancetype)xx_createViewSuperView:(UIView *)superView;

+ (instancetype)xx_createViewFrame:(CGRect)frame superView:(UIView *)superView;

@end
