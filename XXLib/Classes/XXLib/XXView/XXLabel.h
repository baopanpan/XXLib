//
//  XXLabel.h
//  XXKit
//
//  Created by R on 2018/5/8.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXLabel : UILabel
@property (nonatomic, readonly ,copy) XXLabel *(^labText)(NSString *text);
@property (nonatomic, readonly ,copy) XXLabel *(^labFont)(CGFloat font);
@property (nonatomic, readonly ,copy) XXLabel *(^labTextColor)(UIColor *color);
@property (nonatomic, readonly ,copy) XXLabel *(^labBackgroundColor)(UIColor *color);
@property (nonatomic, readonly ,copy) XXLabel *(^labNumberOfLines)(NSInteger numberOfLines);
@property (nonatomic, readonly ,copy) XXLabel *(^labTextAlignment)(NSTextAlignment textAlignment);
@property (nonatomic, readonly ,copy) XXLabel *(^labCornerRadius)(CGFloat radius);
@property (nonatomic, readonly ,copy) XXLabel *(^labSupView)(UIView *);
@property (nonatomic, readonly ,copy) XXLabel *(^labFrame)(CGRect);

+ (instancetype)xx_createLabelFrame:(CGRect)frame text:(NSString *)text supView:(UIView *)supView;
+ (instancetype)xx_createLabelSupView:(UIView *)supView;


@end
