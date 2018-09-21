//
//  XXTableView.m
//  ChatTest
//
//  Created by R on 2018/7/5.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXTableView.h"
#import "XXViewCell.h"

@interface XXTableView () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy) NSString *registerCellName;

@end

@implementation XXTableView

#pragma mark - init
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.dataSource = self;
    self.delegate = self;
    self.tableFooterView = [[UIView alloc] init];
}

+ (instancetype)xx_createTableViewSuperView:(UIView *)superView {
    return [self xx_createTableViewFrame:CGRectZero superView:superView];
}

+ (instancetype)xx_createTableViewFrame:(CGRect)frame superView:(UIView *)superView {
    XXTableView *tableView = [[XXTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    if (superView) {
        [superView addSubview:tableView];
    }
    return tableView;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_numberOfRowsInSection:)]) {
        return [self.xx_tableViewDelegate xx_numberOfRowsInSection:section];
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:numberOfRowsInSection:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView numberOfRowsInSection:section];
    }
    return self.xx_dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:heightForRowAtIndexPath:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView heightForRowAtIndexPath:indexPath];
    }
    if (self.xx_rowHeight) {
        return self.xx_rowHeight;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:cellForRowAtIndexPath:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView cellForRowAtIndexPath:indexPath];
    }
    XXViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_registerCellName];
    cell.block = ^(NSInteger tag, id obj) {
        if (self.cellBlock) {
            self.cellBlock(tag, obj);
        }
    };
    cell.obj = self.xx_dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:didSelectRowAtIndexPath:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView didSelectRowAtIndexPath:indexPath];
    }
    
    if (self.xx_didSelectRowAtIndexPath) {
        self.xx_didSelectRowAtIndexPath((XXTableView *)tableView, indexPath);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:heightForFooterInSection:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView heightForFooterInSection:section];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:heightForHeaderInSection:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView heightForHeaderInSection:section];
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:viewForFooterInSection:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView viewForFooterInSection:section];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([self.xx_tableViewDelegate respondsToSelector:@selector(xx_tableView:heightForHeaderInSection:)]) {
        return [self.xx_tableViewDelegate xx_tableView:(XXTableView *)tableView viewForHeaderInSection:section];
    }
    return nil;
}

#pragma mark- 注册cell
- (void)setXx_registerNib:(NSString *)xx_registerNib {
    _registerCellName = xx_registerNib;
    [self registerNib:[UINib nibWithNibName:xx_registerNib bundle:nil] forCellReuseIdentifier:xx_registerNib];
}

- (void)setXx_registerClass:(NSString *)xx_registerClass {
    _registerCellName = xx_registerClass;
    [self registerClass:NSClassFromString(xx_registerClass) forCellReuseIdentifier:xx_registerClass];
}


- (NSMutableArray *)xx_dataArray {
    if (!_xx_dataArray) {
        _xx_dataArray = [NSMutableArray new];
    }
    if (_xx_emptyView) {
        _xx_emptyView.hidden = [self isShowEmptyView];
    }
    return _xx_dataArray;
}

- (BOOL)isShowEmptyView {
    if (self.xx_dataArray.count == 0) {
        return YES;
    }
    return NO;
}

@end
