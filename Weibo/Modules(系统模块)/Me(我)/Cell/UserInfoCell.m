//
//  UserInfoCell.m
//  Weibo
//
//  Created by liuzedong on 2018/12/23.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "UserInfoCell.h"

@interface UserInfoCell(){
    
     UIImageView *portraitImg;
     UILabel *nickName;
     UILabel *company;
}

@end

@implementation UserInfoCell

- (void)initUI{
    self.backgroundColor = COLOR_WHITE;
    
    
    self->portraitImg = [[UIImageView alloc]init];
    self->portraitImg.layer.cornerRadius = 36;
    self->portraitImg.layer.masksToBounds = YES;
    self->portraitImg.contentMode = UIViewContentModeScaleAspectFit;
    self->portraitImg.backgroundColor = K_COLOR_MAIN_BCK;
    [self.contentView addSubview:self->portraitImg];
    [self->portraitImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(SCALE_Height(12));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-SCALE_Height(18));
        make.width.mas_equalTo(72);
        make.height.mas_equalTo(72);
    }];
    
    
    
    self->company = [[UILabel alloc]init];
    self->company.font = REGULARFONT(FONT_15);
    self->company.textColor = [UIColor yellowColor];
    [self.contentView addSubview:self->company];
    [self->company mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->portraitImg.mas_right).mas_offset(Margin18);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-Height21);
    }];
    
    
    self->nickName = [[UILabel alloc]init];
    self->nickName.font = MEDIUMFONT(FONT_32);
    self->nickName.textColor = COLOR_43495E;
    [self.contentView addSubview:self->nickName];
    [self->nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self->company);
        make.bottom.mas_equalTo(self->company.mas_top).mas_offset(0);
    }];
    
}


- (void)setUserInfoData:(UserModel *)userInfoData{
    
    [self->portraitImg sd_setImageWithURL:[NSURL URLWithString:userInfoData.profile_image_url]];
    self->nickName.text = userInfoData.screen_name;
}

@end
