//
//  UIImage+XX_Image.m
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "UIImage+XX_Image.h"

@implementation UIImage (XX_Image)

+ (UIImage *)xx_resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

+ (UIImage *)xx_imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)xx_colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor {
    
    UIGraphicsBeginImageContext(CGSizeMake(baseImage.size.width*2, baseImage.size.height*2));
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, baseImage.size.width * 2, baseImage.size.height * 2);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSaveGState(ctx);
    CGContextClipToMask(ctx, area, baseImage.CGImage);
    
    [theColor set];
    CGContextFillRect(ctx, area);
    
    CGContextRestoreGState(ctx);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextDrawImage(ctx, area, baseImage.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)xx_cropImageWithSize:(CGSize)size {
    
    float scale = self.size.width/self.size.height;
    CGRect rect = CGRectMake(0, 0, 0, 0);
    
    if (scale > size.width/size.height) {
        
        rect.origin.x = (self.size.width - self.size.height * size.width/size.height)/2;
        rect.size.width  = self.size.height * size.width/size.height;
        rect.size.height = self.size.height;
        
    }else {
        
        rect.origin.y = (self.size.height - self.size.width/size.width * size.height)/2;
        rect.size.width  = self.size.width;
        rect.size.height = self.size.width/size.width * size.height;
        
    }
    
    CGImageRef imageRef   = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return croppedImage;
}

+ (instancetype)xx_circleImageNamed:(NSString *)name
{
    return [[self imageNamed:name] xx_circleImage];
}

- (instancetype)xx_circleImage
{
    // 开启图形上下文 （这个就用到前面的UIView的分类可以直接点出来）
    UIGraphicsBeginImageContext(self.size);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // 添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪(裁剪成刚才添加的图形形状)
    CGContextClip(ctx);
    
    // 往圆上面画一张图片
    [self drawInRect:rect];
    
    // 获得上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
