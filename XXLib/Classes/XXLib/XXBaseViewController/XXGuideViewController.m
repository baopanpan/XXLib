//
//  XXGuideViewController.m
//  ChatTest
//
//  Created by R on 2018/6/25.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXGuideViewController.h"
#import "XXTabBarController.h"
#import "XXKit.h"

@interface XXGuideViewController () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSMutableArray *imageNameArray;

@end

@implementation XXGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    for (int i = 0; i < self.imageNameArray.count; i ++) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight)];
        bgView.backgroundColor = kColorWithRandom;
        [self.scrollView addSubview:bgView];
        [XXImageView xx_createImageViewFrame:CGRectMake(0, 0, bgView.width, bgView.height) imageName:self.imageNameArray[i] superView:bgView];
        if (i == self.imageNameArray.count - 1) {
            XXButton *goHome = [XXButton xx_createButtonSuperView:bgView];
            goHome.btnFrame(CGRectMake(kScreenWidth/2.-75, kScreenHeight - 120, 150, 40));
            goHome.btnBackgroundColor(kRedColor);
            [goHome xx_addButtonClick:^(XXButton *button) {
                XXTabBarController *tabBarCtl = [[XXTabBarController alloc] init];
                UIWindow *window = [UIApplication sharedApplication].delegate.window;
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    
                } completion:^(BOOL finished) {
                    window.rootViewController = tabBarCtl;
                }];
            }];
            self.scrollView.contentSize = CGSizeMake(bgView.width*self.imageNameArray.count, bgView.height);
        }
    }
    
    if (self.imageNameArray.count > 1) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth-100)/2., kScreenHeight - 35, 100, 20)];
        _pageControl.numberOfPages = self.imageNameArray.count;
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.currentPageIndicatorTintColor = kColorWithHex(@"fb376d");
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        [self.view addSubview:_pageControl];
    }
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.contentOffset = CGPointMake(0, 0);
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (NSMutableArray *)imageNameArray {
    if (!_imageNameArray) {
        _imageNameArray = [NSMutableArray arrayWithObjects:@"",@"",@"", nil];
    }
    return _imageNameArray;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_pageControl) {
        int currentPage = scrollView.contentOffset.x/scrollView.width;
        _pageControl.currentPage = currentPage;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
