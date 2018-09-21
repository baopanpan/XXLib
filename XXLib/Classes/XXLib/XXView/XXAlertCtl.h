//
//  XXAlertCtl.h
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+XXCommon.h"

@interface XXAlertCtl : NSObject

///单个按键
+ (void)xx_AlertCtlWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle handler:(void(^)(void))handler;

///双个按键
+ (void)xx_AlertCtlWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancel:(void(^)(void))cancel confirm:(void (^)(void))confirm;

///多个按键
+ (void)xx_AlertCtlWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler;

@end
