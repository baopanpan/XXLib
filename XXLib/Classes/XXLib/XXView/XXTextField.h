//
//  XXTextField.h
//  XXKit
//
//  Created by R on 2018/5/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXTextField : UITextField
///设置最大长度,默认不开启
@property (nonatomic, assign) NSInteger maxLength;
///限制字符或者长度,默认长度
@property (nonatomic, assign) BOOL isCharacter;

+ (instancetype)xx_createTextFieldFrame:(CGRect)frame placeholder:(NSString *)placeholder superView:(UIView *)superView;
+ (instancetype)xx_createTextFieldSuperView:(UIView *)superView;

@end
