//
//  XXSingleTableView.m
//  XXLib_Example
//
//  Created by R on 2018/9/18.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "XXSingleTableView.h"
#import "UITableViewCell+XXCell.h"

@interface XXSingleTableView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) Class cellClass;

@end

@implementation XXSingleTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame]) {
        
        self.tableView = [[UITableView alloc] initWithFrame:frame style:style];
        [self addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableFooterView = [UIView new];
    }
    return self;
}

#pragma mark -- handle data
- (void)registerCellClass:(Class)cellClass {
    self.cellClass = cellClass;
    [self.tableView registerClass:cellClass forCellReuseIdentifier:[cellClass description]];
}

- (void)configWithData:(id)data {
    
    self.dataSource = data;
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellClass description] forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.delegate = self.delegate;
    if (self.dataSource.count) {
        [cell refreshUI:self.dataSource[indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.dataSource.count) {
        return;
    }
    id obj = self.dataSource[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(cellDidClick:data:)]) {
        [self.delegate cellDidClick:indexPath data:obj];
    }
}

#pragma mark -- getter
- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSArray array];
    }
    return _dataSource;
}

@end
