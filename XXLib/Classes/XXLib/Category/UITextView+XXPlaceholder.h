//
//  UITextView+XXPlaceholder.h
//  XXKit
//
//  Created by R on 2018/5/20.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textViewHeightDidChangedBlock)(CGFloat currentTextViewHeight);

@interface UITextView (XXPlaceholder)

/* 占位文字 */
@property (nonatomic, copy) NSString *xx_placeholder;
@property (nonatomic, copy) NSString *placeholder NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_placeholder");

/* 占位文字颜色 */
@property (nonatomic, strong) UIColor *xx_placeholderColor;
@property (nonatomic, strong) UIColor *placeholderColor NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_placeholderColor");

/* 最大高度，如果需要随文字改变高度的时候使用 */
@property (nonatomic, assign) CGFloat xx_maxHeight;
@property (nonatomic, assign) CGFloat maxHeight NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_maxHeight");

/* 最小高度，如果需要随文字改变高度的时候使用 */
@property (nonatomic, assign) CGFloat xx_minHeight;
@property (nonatomic, assign) CGFloat minHeight NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_minHeight");

@property (nonatomic, copy) textViewHeightDidChangedBlock xx_textViewHeightDidChanged;
@property (nonatomic, copy) textViewHeightDidChangedBlock textViewHeightDidChanged NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_textViewHeightDidChanged");

/* 获取图片数组 */
- (NSArray *)xx_getImages;
- (NSArray *)getImages NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_getImages");

/* 自动高度的方法，maxHeight：最大高度 */
- (void)xx_autoHeightWithMaxHeight:(CGFloat)maxHeight;
- (void)autoHeightWithMaxHeight:(CGFloat)maxHeight NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_autoHeightWithMaxHeight:");

/* 自动高度的方法，maxHeight：最大高度， textHeightDidChanged：高度改变的时候调用 */
- (void)xx_autoHeightWithMaxHeight:(CGFloat)maxHeight textViewHeightDidChanged:(textViewHeightDidChangedBlock)textViewHeightDidChanged;
- (void)autoHeightWithMaxHeight:(CGFloat)maxHeight textViewHeightDidChanged:(textViewHeightDidChangedBlock)textViewHeightDidChanged NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用autoHeightWithMaxHeight:textViewHeightDidChanged:");

/* 添加一张图片 image:要添加的图片 */
- (void)xx_addImage:(UIImage *)image;
- (void)addImage:(UIImage *)image NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_addImage:");

/* 添加一张图片 image:要添加的图片 size:图片大小 */
- (void)xx_addImage:(UIImage *)image size:(CGSize)size;
- (void)addImage:(UIImage *)image size:(CGSize)size  NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_addImage:size:");

/* 插入一张图片 image:要添加的图片 size:图片大小 index:插入的位置 */
- (void)xx_insertImage:(UIImage *)image size:(CGSize)size index:(NSInteger)index;
- (void)insertImage:(UIImage *)image size:(CGSize)size index:(NSInteger)index NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用insertImage:size:index:");

/* 添加一张图片 image:要添加的图片 multiple:放大／缩小的倍数 */
- (void)xx_addImage:(UIImage *)image multiple:(CGFloat)multiple;
- (void)addImage:(UIImage *)image multiple:(CGFloat)multiple NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_addImage:multiple:");

/* 插入一张图片 image:要添加的图片 multiple:放大／缩小的倍数 index:插入的位置 */
- (void)xx_insertImage:(UIImage *)image multiple:(CGFloat)multiple index:(NSInteger)index;
- (void)insertImage:(UIImage *)image multiple:(CGFloat)multiple index:(NSInteger)index NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, "请使用xx_insertImage:multiple:index:");


@end
