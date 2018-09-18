//
//  XXSingleTableView.h
//  XXLib_Example
//
//  Created by R on 2018/9/18.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXCellProtocol.h"

@interface XXSingleTableView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) id<XXCellProtocol> delegate;

/// init method
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
/// class for 'cell'
- (void)registerCellClass:(Class)cellClass;
/// config 'view' with 'data'
- (void)configWithData:(id)data;

@end
