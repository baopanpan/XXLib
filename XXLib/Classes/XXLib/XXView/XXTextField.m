//
//  XXTextField.m
//  XXKit
//
//  Created by R on 2018/5/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXTextField.h"

struct DRTextInfo {
    NSInteger length;
    NSInteger number;
};
typedef struct DRTextInfo DRTextInfo;

@implementation XXTextField

+ (instancetype)xx_createTextFieldSuperView:(UIView *)superView {
    return [self xx_createTextFieldFrame:CGRectZero placeholder:nil superView:superView];
}

+ (instancetype)xx_createTextFieldFrame:(CGRect)frame placeholder:(NSString *)placeholder superView:(UIView *)superView {
    XXTextField *textField = [[XXTextField alloc] initWithFrame:frame];
    textField.placeholder = placeholder;
    [superView addSubview:textField];
    return textField;
}

- (void)setMaxLength:(NSInteger)maxLength {
    _maxLength = maxLength;
    [self addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldEditingChanged:(UITextField *)textField
{
    if (self.maxLength) {
        DRTextInfo text = [self getTextFieldText:textField.text maxLength:_maxLength];
        //获取高亮部分
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position || !selectedRange)
        {
            if (self.isCharacter) {
                if (text.length > _maxLength) {
                    textField.text = [textField.text substringToIndex:text.number];
                }
            } else {
                if (textField.text.length > _maxLength) {
                    textField.text = [textField.text substringToIndex:_maxLength];
                }
            }
            
        }
    }
}

- (DRTextInfo)getTextFieldText:(NSString *)string maxLength:(NSInteger)maxLength
{
    DRTextInfo textInfo;
    if (!self.isCharacter) {
        textInfo.length = string.length;
        textInfo.number = string.length;
        return textInfo;
    }
    __block NSInteger length = 0;
    __block NSInteger number = 0;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                if (substringRange.length == 1) {
                                    unichar ch = [string characterAtIndex:substringRange.location];
                                    if (isascii(ch) == 1) {
                                        length ++;
                                    } else {
                                        length = length + 2;
                                    }
                                    if (length <= maxLength) {
                                        number ++;
                                    }
                                } else {
                                    length = length + 4;
                                    if (length <= maxLength) {
                                        number = number + 2;
                                    }
                                }
                            }];
    textInfo.length = length;
    textInfo.number = number;
    
    return textInfo;
}

@end
