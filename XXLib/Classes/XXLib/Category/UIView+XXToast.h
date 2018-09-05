//
//  UIView+XXToast.h
//  XXKit
//
//  Created by R on 2018/5/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XXToast)

- (void)xx_showToast:(NSString *)message;

+ (void)xx_showToastOnWindow:(NSString *)message;

@end
