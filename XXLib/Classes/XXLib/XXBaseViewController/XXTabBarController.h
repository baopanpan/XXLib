//
//  XXTabBarController.h
//  ChatTest
//
//  Created by R on 2018/6/22.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXTabBarController : UITabBarController

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

@end
