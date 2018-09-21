 //
//  XXTableView.h
//  ChatTest
//
//  Created by R on 2018/7/5.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXTableView;

/**
    适用于单组,cell固定
    多个类型cell以及高度动态变化,要写XXTableViewDelegate,重写代理方法
 */



/** tableView代理 */
@protocol XXTableViewDelegate <NSObject>
@optional
- (void)xx_tableView:(XXTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)xx_numberOfRowsInSection:(NSInteger)section;
- (NSInteger)xx_tableView:(XXTableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)xx_tableView:(XXTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)xx_tableView:(XXTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)xx_tableView:(XXTableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)xx_tableView:(XXTableView *)tableView heightForFooterInSection:(NSInteger)section;
- (UIView *)xx_tableView:(XXTableView *)tableView viewForHeaderInSection:(NSInteger)section;
- (UIView *)xx_tableView:(XXTableView *)tableView viewForFooterInSection:(NSInteger)section;

@end

@interface XXTableView : UITableView
@property (nonatomic,weak) id <XXTableViewDelegate> xx_tableViewDelegate;
@property (nonatomic,strong) NSMutableArray *xx_dataArray;
/** 纯代码注册cell */
@property (nonatomic,copy) NSString *xx_registerClass;
/** xib注册cell */
@property (nonatomic,copy) NSString *xx_registerNib;
/** 是否自适应高度 */
@property (nonatomic,assign) BOOL xx_autoRowHeight;
/** row高度 */
@property (nonatomic,assign) CGFloat xx_rowHeight;
/** 无数据展示视图 */
@property (nonatomic,strong) UIView *xx_emptyView;
/** 点击cell事件 */
@property (nonatomic,copy) void (^xx_didSelectRowAtIndexPath)(XXTableView *tableView,NSIndexPath *indexPath);
/** cell按钮点击回调 */
@property (nonatomic,copy) void (^cellBlock)(NSInteger tag,id obj);

+ (instancetype)xx_createTableViewSuperView:(UIView *)superView;

+ (instancetype)xx_createTableViewFrame:(CGRect)frame superView:(UIView *)superView;


@end
