//
//  StatusCell.m
//  Weibo
//
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "StatusCell.h"

@interface StatusCell(){
    UIImageView *avatar_ImgView;
    UILabel *name_Lab;
    UILabel *creatTime_Lab;
//    UILabel *text_Lab;
    UILabel *source_Lab;
    UIImageView *contentPic_ImgView;
    
}
@end

@implementation StatusCell


- (void)initUI{
    [self.contentView setBackgroundColor:[UIColor yellowColor]];
    
    avatar_ImgView = [[UIImageView alloc]init];
    [avatar_ImgView sd_setImageWithURL:[NSURL URLWithString:self.statusData.user.profile_image_url]];
    avatar_ImgView.layer.cornerRadius = SCALE_Heigth(20);
    [self.contentView addSubview:avatar_ImgView];
    [avatar_ImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(Margin12);
        make.width.height.mas_equalTo(SCALE_Heigth(40));
    }];
    
    name_Lab = [[UILabel alloc]init];
    name_Lab.font = MEDIUMFONT(FONT_15);
    name_Lab.text = self.statusData.user.name;
    [self.contentView addSubview:name_Lab];
    [name_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->avatar_ImgView.mas_right).mas_offset(Margin12);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(Margin12);
    }];
    
    self.text_Lab = [[UILabel alloc]init];
    self.text_Lab.font = MEDIUMFONT(FONT_15);
//    self.text_Lab.text = self.statusData.text;
    [self.contentView addSubview:self.text_Lab];
    [self.text_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-Margin12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(0);
//        make.height.mas_equalTo(1);
    }];
    
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
