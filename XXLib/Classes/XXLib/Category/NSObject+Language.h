//
//  NSObject+Language.h
//  test
//
//  Created by R on 2018/6/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Language)

///国际化
- (NSString *)languageWithString:(NSString *)string;

///初始化语言 跟随系统切换
- (void)initLanguage;

///手动设置简体中文
- (void)setLanguageToChinese;

///手动设置英文
- (void)setLanguageToEnglish;

@end
