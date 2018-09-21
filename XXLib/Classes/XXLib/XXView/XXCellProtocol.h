//
//  XXCellProtocol.h
//  XXLib_Example
//
//  Created by R on 2018/9/18.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XXCellProtocol <NSObject>

@optional;
/// tableView中点击cell的代理
- (void)cellDidClick:(NSIndexPath *)indexPath data:(id)obj;
/// cell上点击事件代理方法 tag作为区分
- (void)cellHeaderIconDidClick:(NSIndexPath *)indexPath data:(id)obj tag:(NSInteger)tag;

@end
