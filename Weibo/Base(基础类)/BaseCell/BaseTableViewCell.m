//
//  BaseTableViewCell.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([[self class] respondsToSelector:@selector(style)])
    {
        style = [[self class] style];
    }
    if(self = [super initWithStyle:style
                   reuseIdentifier:reuseIdentifier])
    {
        self.textLabel.font = SYSTEMFONT(15);
        //        self.textLabel.textColor = K_CELL_TITLELABEL_BACKGROUND;
        self.detailTextLabel.font = SYSTEMFONT(14);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    
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
