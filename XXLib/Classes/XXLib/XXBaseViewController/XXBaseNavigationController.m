//
//  XXBaseNavigationController.m
//  ChatTest
//
//  Created by R on 2018/6/22.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXBaseNavigationController.h"

@interface XXBaseNavigationController ()

@end

@implementation XXBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    
    [self.navigationBar setTranslucent:NO];
    //背景色
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    //标题字体
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:17],NSFontAttributeName, nil ]] ;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        //
        if ([viewController respondsToSelector:@selector(setHidesBottomBarWhenPushed:)]) {
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    [super pushViewController:viewController animated:animated];
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
