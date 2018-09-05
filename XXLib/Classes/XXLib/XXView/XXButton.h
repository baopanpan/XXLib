//
//  XXButton.h
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXButton : UIButton

typedef void(^ButtonClickBlock)(XXButton *button);

@property (nonatomic, readonly ,strong) XXButton *(^btnNormalTitle)(NSString *);
@property (nonatomic, readonly ,strong) XXButton *(^btnSelectTitle)(NSString *);
@property (nonatomic, readonly ,strong) XXButton *(^btnNormalImageName)(NSString *);
@property (nonatomic, readonly ,strong) XXButton *(^btnSelectImageName)(NSString *);
@property (nonatomic, readonly ,strong) XXButton *(^btnNormalBackgroundImageName)(NSString *);
@property (nonatomic, readonly ,strong) XXButton *(^btnSelectBackgroundImageName)(NSString *);
@property (nonatomic, readonly ,strong) XXButton *(^btnNormalTitleColor)(UIColor *);
@property (nonatomic, readonly ,strong) XXButton *(^btnSelectTitleColor)(UIColor *);
@property (nonatomic, readonly ,strong) XXButton *(^btnBackgroundColor)(UIColor *);
@property (nonatomic, readonly ,strong) XXButton *(^btnFont)(CGFloat);
@property (nonatomic, readonly ,strong) XXButton *(^btnTag)(NSInteger);
@property (nonatomic, readonly ,strong) XXButton *(^btnCornerRadius)(CGFloat);
@property (nonatomic, readonly ,strong) XXButton *(^btnBorderWidth)(CGFloat);
@property (nonatomic, readonly ,strong) XXButton *(^btnBorderColor)(UIColor *);
@property (nonatomic, readonly ,strong) XXButton *(^btnSuperView)(UIView *);
@property (nonatomic, readonly ,strong) XXButton *(^btnFrame)(CGRect);

@property (nonatomic, copy) ButtonClickBlock buttonClickBlock;
/**NO:禁止快速点击 默认NO*/
@property (nonatomic, assign) BOOL isSoonClick;

+ (instancetype)xx_createButtonFrame:(CGRect)frame title:(NSString *)title superView:(UIView *)superView;
+ (instancetype)xx_createButtonSuperView:(UIView *)superView;

/**
 初始化button

 @param superView 父视图
 @param initBlock button属性设置回调
 @param block 点击事件回调
 @return 返回button
 */
+ (instancetype)xx_createButtonSuperView:(UIView *)superView initButton:(void(^)(XXButton *button))initBlock buttonClick:(ButtonClickBlock)block;


/**
 添加button点击事件

 @param block 回调
 */
- (void)xx_addButtonClick:(ButtonClickBlock)block;

@end
