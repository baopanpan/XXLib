//
//  NSString+XX_String.m
//  ChatTest
//
//  Created by R on 2018/6/22.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "NSString+XXString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (XXString)

- (NSString *)xx_md5Digest {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

+ (NSString *)xx_UUID {
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    
    CFStringRef stringRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    CFRelease(uuidRef);
    
    NSString *uuidString = [(__bridge NSString *)stringRef lowercaseString];
    CFRelease(stringRef);
    
    return uuidString;
}


@end
