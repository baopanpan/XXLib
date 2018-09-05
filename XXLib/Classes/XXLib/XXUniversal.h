//
//  XXUniversal.h
//  XXKit
//
//  Created by R on 2018/5/7.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#ifndef XXUniversal_h
#define XXUniversal_h

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kWidth(width) (width * kScreenWidth)/375.f
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kNavigationBarHeight (kDevice_Is_iPhoneX ? 88 : 64)
#define kTopMargin (kDevice_Is_iPhoneX ? 24 : 0)
#define kBottomMargin (kDevice_Is_iPhoneX ? 34 : 0)

/** RGB*/
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1]
/** RGB 透明度*/
#define kColorWithRGBWithAlpha(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:a]

/** 随机色*/
#define kColorWithRandom [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:0.5]

/** color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式*/
#define kColorWithHex(stringHex)   [UIColor colorWithHexString:stringHex]

#define kColorWithHexAlpha(stringHex,alpha)   [UIColor colorWithHexString:stringHex alpha:alpha]

#define kBlackColor       [UIColor blackColor]
#define kDarkGrayColor    [UIColor darkGrayColor]
#define kLightGrayColor   [UIColor lightGrayColor]
#define kWhiteColor       [UIColor whiteColor]
#define kRedColor         [UIColor redColor]
#define kBlueColor        [UIColor blueColor]
#define kGreenColor       [UIColor greenColor]
#define kCyanColor        [UIColor cyanColor]
#define kYellowColor      [UIColor yellowColor]
#define kMagentaColor     [UIColor magentaColor]
#define kOrangeColor      [UIColor orangeColor]
#define kPurpleColor      [UIColor purpleColor]
#define kBrownColor       [UIColor brownColor]
#define kClearColor       [UIColor clearColor]

/** __weak弱引用*/
#define WeakSelf __weak typeof(self) weakSelf = self;
#define weakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define strongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#define APPDELEGATE             ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define FIRST_INSTALL_APP @"FIRST_INSTALL_APP"

#define kMessageContentFont 14

#endif /* XXUniversal_h */
