//
//  XXViewCell.h
//  ChatTest
//
//  Created by R on 2018/7/6.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXViewCell : UITableViewCell
@property (nonatomic,copy) void (^block)(NSInteger tag, id obj);
@property (nonatomic,strong) id obj;

@end
