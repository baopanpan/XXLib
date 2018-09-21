//
//  XXImageView.h
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXImageView : UIImageView

typedef void(^ImageViewTapBlock)(XXImageView *imageView);

@property (nonatomic, readonly ,strong) XXImageView *(^imageName)(NSString *);
@property (nonatomic, readonly ,strong) XXImageView *(^imageViewImage)(UIImage *);
@property (nonatomic, readonly ,strong) XXImageView *(^imageViewTag)(NSInteger);
@property (nonatomic, readonly ,strong) XXImageView *(^imageViewColor)(UIColor *);
@property (nonatomic, readonly ,strong) XXImageView *(^imageViewCornerRadius)(CGFloat);
@property (nonatomic, readonly ,strong) XXImageView *(^imageViewSuperView)(UIView *);
@property (nonatomic, readonly ,strong) XXImageView *(^imageViewFrame)(CGRect);

@property (nonatomic, copy) ImageViewTapBlock imageViewTapBlock;

+ (instancetype)xx_createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName superView:(UIView *)superView;
+ (instancetype)xx_createImageViewSuperView:(UIView *)superView;
+ (instancetype)xx_createImageViewSuperView:(UIView *)superView initImageView:(void(^)(XXImageView *imageView))imageViewBlock imageViewTapGesture:(ImageViewTapBlock)block;

- (void)xx_addImageViewTapGesture:(ImageViewTapBlock)imageViewTapBlock;
- (void)xx_addImageViewLongPressGesture:(ImageViewTapBlock)imageViewTapBlock;

@end
