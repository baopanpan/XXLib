//
//  XXAlertCtl.m
//  XXKit
//
//  Created by R on 2018/5/24.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXAlertCtl.h"

@implementation XXAlertCtl

+ (void)xx_AlertCtlWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle handler:(void (^)(void))handler {
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler();
        }
    }];
    [alertCtl addAction:cancelAction];
    [[self getCurrentVC] presentViewController:alertCtl animated:YES completion:nil];
}

+ (void)xx_AlertCtlWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle confirmTitle:(NSString *)confirmTitle cancel:(void (^)(void))cancel confirm:(void (^)(void))confirm {
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancel) {
            cancel();
        }
    }];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirm) {
            confirm();
        }
    }];
    [alertCtl addAction:confirmAction];
    [alertCtl addAction:cancelAction];
    [[self getCurrentVC] presentViewController:alertCtl animated:YES completion:nil];
}

+ (void)xx_AlertCtlWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void (^)(NSUInteger, NSString *))handler {
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler(0,@"取消");
        }
    }];
    [alertCtl addAction:cancelAction];
    for (int i = 0; i < actionTitles.count; i ++) {
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler((i + 1), actionTitles[i]);
        }];
        [alertCtl addAction:confimAction];
    }
    [[self getCurrentVC] presentViewController:alertCtl animated:YES completion:nil];
}

@end
