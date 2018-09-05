//
//  NSObject+XXCommon.h
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (XXCommon)

///获取当前vc
- (UIViewController *)getCurrentVC;

///toast提示
- (void)xx_showWithString:(NSString *)string;


@end
