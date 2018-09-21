//
//  BPPTestViewCell.m
//  XXLib_Example
//
//  Created by R on 2018/9/18.
//  Copyright © 2018年 baopanpan. All rights reserved.
//

#import "BPPTestViewCell.h"


@interface BPPTestViewCell ()
@property (nonatomic,strong) UILabel *la;

@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,copy) NSString *str;

@end

@implementation BPPTestViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
        [self.contentView addSubview:_la];
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor redColor];
        _btn.frame = CGRectMake(0, CGRectGetMaxY(_la.frame), 50, 30);
        [_btn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_btn];
    }
    return self;
}

- (void)refreshUI:(id)obj {
    _str = obj;
    _la.text = _str;
}

- (void)add {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
