//
//  NSObject+Language.m
//  test
//
//  Created by R on 2018/6/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "NSObject+Language.h"

#define NSLocalizedStringFromTable(key, tbl, comment) \
[NSBundle.mainBundle localizedStringForKey:(key) value:@"" table:(tbl)]

@implementation NSObject (Language)

- (NSString *)languageWithString:(NSString *)string {
    return NSLocalizedStringFromTable(string, @"File", nil);
}

- (void)initLanguage {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]) {
        NSArray  *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"zh-Hans"]) {
            [self setLanguageToChinese];
        } else {
            [self setLanguageToEnglish];
        }
    }
}

- (void)setLanguageToChinese {
     [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
}

- (void)setLanguageToEnglish {
     [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
}

@end
