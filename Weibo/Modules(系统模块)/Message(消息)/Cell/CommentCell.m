//
//  CommentCell.m
//  Weibo
//
//  Created by Zedong on 2018/12/29.
//  Copyright © 2018年 liuzedong. All rights reserved.
//

#import "CommentCell.h"

@interface CommentCell(){
    UIImageView *avatar_ImgView;
    UILabel *name_Lab;
    UILabel *creatTime_Lab;
    UILabel *source_Lab;
    
    UILabel *text_Lab;
    
    UIView *statusView;
}

@end

@implementation CommentCell

- (void)initUI{
    
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    
    //头像
    avatar_ImgView = [[UIImageView alloc]init];
    avatar_ImgView.layer.cornerRadius = SCALE_Height(15);
    self->avatar_ImgView.layer.masksToBounds = YES;
    [self.contentView addSubview:avatar_ImgView];
    [avatar_ImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(Margin12);
        make.width.height.mas_equalTo(SCALE_Height(30));
    }];
    
    // 昵称
    name_Lab = [[UILabel alloc]init];
    name_Lab.textColor = COLOR_Emphasize;
    name_Lab.font = MEDIUMFONT(FONT_14);
    [self.contentView addSubview:name_Lab];
    [name_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->avatar_ImgView.mas_right).mas_offset(Margin12);
        make.top.mas_equalTo(self->avatar_ImgView.mas_top).mas_offset(0);
    }];
    
    // 时间
    creatTime_Lab = [[UILabel alloc]init];
    creatTime_Lab.textColor = COLOR_Support;
    creatTime_Lab.font = REGULARFONT(FONT_9);
    [self.contentView addSubview:creatTime_Lab];
    [creatTime_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->avatar_ImgView.mas_right).mas_offset(Margin12);
        make.bottom.mas_equalTo(self->avatar_ImgView.mas_bottom).mas_offset(0);
    }];
    
    // 内容
    text_Lab = [[UILabel alloc]init];
    text_Lab.textColor = COLOR_ContentText;
    text_Lab.font = REGULARFONT(FONT_16);
    text_Lab.textColor = [UIColor blackColor];
    text_Lab.numberOfLines = 0;
    [self.contentView addSubview:text_Lab];
    [text_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-Margin12);
        make.top.mas_equalTo(self->avatar_ImgView.mas_bottom).mas_offset(Margin12);
    }];
    
    statusView = [[UIView alloc]init];
    [statusView setBackgroundColor:COLOR_RepostBGC];
    [self.contentView addSubview:statusView];
    [statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self->text_Lab.mas_bottom).mas_offset(Margin12);
        make.height.mas_equalTo(SCALE_Height(60));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-Margin12);
    }];
    
}

- (void)setCommentData:(CommentModel *)commentData{
    [avatar_ImgView sd_setImageWithURL:[NSURL URLWithString:commentData.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
    name_Lab.text = commentData.user.screen_name;
    creatTime_Lab.text = [NSString stringWithFormat:@"%@ ",commentData.created_at];
    text_Lab.text = commentData.text;
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
