
//
//  UITableViewCell+XXCell.m
//  XXLib_Example
//
//  Created by R on 2018/9/18.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "UITableViewCell+XXCell.h"
#import <objc/runtime.h>

static char indexPathKey,delegateKey;

@implementation UITableViewCell (XXCell)

- (void)setIndexPath:(NSIndexPath *)indexPath {
    
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, &indexPathKey);
}

- (void)setDelegate:(id<XXCellProtocol>)delegate {
    objc_setAssociatedObject(self, &delegateKey, delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<XXCellProtocol>)delegate {
    return objc_getAssociatedObject(self, &delegateKey);
}

- (void)refreshUI:(id)obj {
    
}

@end
