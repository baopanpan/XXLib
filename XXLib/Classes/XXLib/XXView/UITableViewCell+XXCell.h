//
//  UITableViewCell+XXCell.h
//  XXLib_Example
//
//  Created by R on 2018/9/18.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXCellProtocol.h"

@interface UITableViewCell (XXCell)
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id<XXCellProtocol> delegate;

//方法
- (void)refreshUI:(id)obj;

@end
