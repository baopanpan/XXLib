//
//  UIImage+XX_Image.h
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XX_Image)

/**
 *  自由拉伸一张图片
 *
 *  @param name 图片名字
 *  @param left 左边开始位置比例  值范围0-1
 *  @param top  上边开始位置比例  值范围0-1
 *
 *  @return 拉伸后的Image
 */
+ (UIImage *)xx_resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)xx_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 */
+ (UIImage *)xx_colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;

/**
 *  自由改变Image的大小
 *
 *  @param size 目的大小
 *
 *  @return 修改后的Image
 */
- (UIImage *)xx_cropImageWithSize:(CGSize)size;

/**
 *  圆形图片
 */
+ (instancetype)xx_circleImageNamed:(NSString *)name;

/**
 *  圆形图片
 */
- (instancetype)xx_circleImage;

@end
