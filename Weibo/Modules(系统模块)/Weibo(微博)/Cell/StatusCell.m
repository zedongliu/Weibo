//
//  StatusCell.m
//  Weibo
//  原创微博cell
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "StatusCell.h"
#import "StatusPicCollectionView.h"

@interface StatusCell(){
    
    UIImageView *avatar_ImgView;
    UILabel *name_Lab;
    UILabel *creatTime_Lab;
    UILabel *source_Lab;
    
    UILabel *text_Lab;
    
    UIView *picView;
    StatusPicCollectionView *pic_collectionView;
    
    UIView *bottomView;
    UIButton *repostBtn;    // 转发
    UIButton *commentBtn;   // 评论
    UIButton *attitudeBtn;  // 点赞
}
@end

@implementation StatusCell


- (void)initUI{
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    
    avatar_ImgView = [[UIImageView alloc]init];
    avatar_ImgView.layer.cornerRadius = SCALE_Heigth(15);
    [self.contentView addSubview:avatar_ImgView];
    [avatar_ImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(Margin12);
        make.width.height.mas_equalTo(SCALE_Heigth(30));
    }];
    
    
    name_Lab = [[UILabel alloc]init];
    name_Lab.textColor = COLOR_Emphasize;
    name_Lab.font = MEDIUMFONT(FONT_14);
    [self.contentView addSubview:name_Lab];
    [name_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->avatar_ImgView.mas_right).mas_offset(Margin12);
        make.top.mas_equalTo(self->avatar_ImgView.mas_top).mas_offset(0);
    }];
    
    
    creatTime_Lab = [[UILabel alloc]init];
    creatTime_Lab.textColor = COLOR_Support;
    creatTime_Lab.font = REGULARFONT(FONT_9);
    [self.contentView addSubview:creatTime_Lab];
    [creatTime_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->avatar_ImgView.mas_right).mas_offset(Margin12);
        make.bottom.mas_equalTo(self->avatar_ImgView.mas_bottom).mas_offset(0);
    }];
    
    
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
    
    
//    picView = [[UIView alloc]init];
//    [self.contentView addSubview:picView];
//    [picView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self.contentView);
//        make.top.mas_equalTo(self->text_Lab.mas_bottom).mas_offset(Margin12);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-Margin12);
//    }];
    
    
    bottomView = [[UIView alloc]init];
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self->text_Lab.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(SCALE_Heigth(20));
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(0);
    }];
    
    //转发
    UIView *repostView = [[UIView alloc]init];
    [self.contentView addSubview:repostView];
    [repostView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self->bottomView);
        make.width.mas_equalTo(KScreenWidth/3);
    }];
    repostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    repostBtn.titleLabel.font =REGULARFONT( FONT_9);
    [repostBtn setImage:[UIImage imageNamed:@"repost_icon"] forState:UIControlStateNormal];
    [repostBtn setTitleColor:COLOR_StatusBottom forState:UIControlStateNormal];
    [repostView addSubview:repostBtn];
    [repostBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(repostView);
    }];
    
    //评论
    UIView *commentView = [[UIView alloc]init];
    [self.contentView addSubview:commentView];
    [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self->bottomView);
        make.left.mas_equalTo(repostView.mas_right);
        make.width.mas_equalTo(KScreenWidth/3);
    }];
    commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentBtn.titleLabel.font =REGULARFONT( FONT_9);
    [commentBtn setImage:[UIImage imageNamed:@"comment_icon"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:COLOR_StatusBottom forState:UIControlStateNormal];
    [commentView addSubview:commentBtn];
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(commentView);
    }];
    
    //点赞
    UIView *attitudeView = [[UIView alloc]init];
    [self.contentView addSubview:attitudeView];
    [attitudeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(self->bottomView);
        make.width.mas_equalTo(KScreenWidth/3);
    }];
    attitudeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    attitudeBtn.titleLabel.font =REGULARFONT( FONT_12);
    [attitudeBtn setImage:[UIImage imageNamed:@"attitude_icon"] forState:UIControlStateNormal];
    [attitudeBtn setTitleColor:COLOR_StatusBottom forState:UIControlStateNormal];
    [attitudeView addSubview:attitudeBtn];
    [attitudeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(attitudeView);
    }];
    
}

- (void)setData:(StatusModel *)statusData{
    
    [avatar_ImgView sd_setImageWithURL:[NSURL URLWithString:statusData.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
    name_Lab.text = statusData.user.screen_name;
    creatTime_Lab.text = [NSString stringWithFormat:@"%@ ",statusData.created_at];
    text_Lab.text = statusData.text;
    
//    NSMutableArray *picArr = [NSMutableArray array];
//    pic_collectionView = [[StatusPicCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 200) itemSize:CGSizeMake(100, 180) withImageArr:picArr];
//    [self->picView addSubview:pic_collectionView];
    
    [repostBtn setTitle:[NSString stringWithFormat:@"%ld", (long)statusData.reposts_count] forState:UIControlStateNormal];
    [commentBtn setTitle:[NSString stringWithFormat:@"%ld", (long)statusData.comments_count] forState:UIControlStateNormal];
    [attitudeBtn setTitle:[NSString stringWithFormat:@"%ld", (long)statusData.attitudes_count] forState:UIControlStateNormal];
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
