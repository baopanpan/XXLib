//
//  UIView+Empty.h
//  test
//
//  Created by R on 2018/8/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Empty)

/**
 无数据时显示图片

 @param imageName 图片名称
 @param result 是否展示
 */
- (void)showEmptyViewWithImageName:(NSString *)imageName showResult:(BOOL)result;


/**
 无数据时 文字描述

 @param text 内容
 @param result 是否显示
 */
- (void)showEmptyViewWithText:(NSString *)text showResult:(BOOL)result;


/**
 无数据时 显示图片 文字描述

 @param imageName 图片名称
 @param text 文字描述
 @param result 是否显示
 */
- (void)showEmptyViewWithImageName:(NSString *)imageName text:(NSString *)text showResult:(BOOL)result;


@end
