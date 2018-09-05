//
//  XXTabBarController.m
//  ChatTest
//
//  Created by R on 2018/6/22.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXTabBarController.h"
#import "XXBaseNavigationController.h"


@interface XXTabBarController ()

@end

@implementation XXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    UIImage *nomarlImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置子控制器的图片
    childVc.tabBarItem.image = nomarlImage;
    if ([UIDevice currentDevice].systemVersion.intValue >= 7) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else
    {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    // 先给外面传进来的小控制器 包装 一个导航控制器
    XXBaseNavigationController *nav = [[XXBaseNavigationController alloc] initWithRootViewController:childVc];
    
    // 添加为子控制器
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
