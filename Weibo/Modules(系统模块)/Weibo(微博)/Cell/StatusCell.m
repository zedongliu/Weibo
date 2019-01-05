//
//  StatusCell.m
//  Weibo
//  原创微博cell
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "StatusCell.h"
#import "StatusPicCollectionView.h"
#import "StatusView.h"
#import "MLEmojiLabel.h"

@interface StatusCell()<MLEmojiLabelDelegate,UIGestureRecognizerDelegate>{
    
    UIImageView *avatar_ImgView;
    UILabel *name_Lab;
    UILabel *creatTime_Lab;
    UILabel *source_Lab;
    MLEmojiLabel *text_Lab;
    UIView *picView;
    StatusPicCollectionView *pic_collectionView;
    
    UIView *retweeted_statusView; // 原微博
    UIImageView *avatar_ImgView1;
    UILabel *name_Lab1;
    UILabel *creatTime_Lab1;
    UILabel *source_Lab1;
    MLEmojiLabel *text_Lab1;
    UIView *picView1;
    StatusPicCollectionView *pic_collectionView1;
    
    UIView *bottomView;
    UIButton *repostBtn;    // 转发
    UIButton *commentBtn;   // 评论
    UIButton *attitudeBtn;  // 点赞
}
@end

@implementation StatusCell


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
    text_Lab = [MLEmojiLabel new];
    text_Lab.delegate = self;
    text_Lab.lineBreakMode = NSLineBreakByTruncatingTail;
    text_Lab.backgroundColor = [UIColor whiteColor];
    text_Lab.isNeedAtAndPoundSign = YES;
    text_Lab.disableEmoji = YES;
    text_Lab.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    text_Lab.textColor = COLOR_ContentText;
    text_Lab.font = REGULARFONT(FONT_16);
    text_Lab.numberOfLines = 0;
    [self.contentView addSubview:text_Lab];
    [text_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-Margin12);
        make.top.mas_equalTo(self->avatar_ImgView.mas_bottom).mas_offset(Margin12);
    }];
    
    // 图片
    picView = [[UIView alloc]init];
    [self.contentView addSubview:picView];
    [picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(Margin12);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-Margin12);
        make.top.mas_equalTo(self->text_Lab.mas_bottom).mas_offset(Margin12);
        make.height.mas_equalTo(SCALE_Height(0));
    }];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    retweeted_statusView = [[UIView alloc]init];
    [retweeted_statusView setBackgroundColor:COLOR_RepostBGC];
    [self.contentView addSubview:retweeted_statusView];
    [retweeted_statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(0);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-0);
        make.top.mas_equalTo(self->picView.mas_bottom).mas_offset(Margin12);
    }];
    
    // 内容
    text_Lab1 = [MLEmojiLabel new];
    text_Lab1.delegate = self;
    text_Lab1.lineBreakMode = NSLineBreakByTruncatingTail;
    text_Lab1.backgroundColor = COLOR_RepostBGC;
    text_Lab1.isNeedAtAndPoundSign = YES;
    text_Lab1.disableEmoji = YES;
    text_Lab1.verticalAlignment = TTTAttributedLabelVerticalAlignmentCenter;
    text_Lab1.textColor = COLOR_ContentText;
    text_Lab1.font = REGULARFONT(FONT_16);
    text_Lab1.numberOfLines = 0;
    [retweeted_statusView addSubview:text_Lab1];
    [text_Lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->retweeted_statusView.mas_left).mas_offset(Margin12);
        make.top.mas_equalTo(self->retweeted_statusView.mas_top).mas_offset(Margin12);
        make.right.mas_equalTo(self->retweeted_statusView.mas_right).mas_offset(-Margin12);
        make.bottom.mas_equalTo(self->retweeted_statusView.mas_bottom).mas_offset(-Margin12);
    }];
    
    // 图片
    picView1 = [[UIView alloc]init];
    [self->retweeted_statusView addSubview:picView1];
    [picView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->retweeted_statusView.mas_left).mas_offset(Margin12);
        make.right.mas_equalTo(self->retweeted_statusView.mas_right).mas_offset(-Margin12);
        make.top.mas_equalTo(self->text_Lab1.mas_bottom).mas_offset(Margin12);
        make.height.mas_equalTo(SCALE_Height(0));
    }];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 分割线
    UIView *line = [[UIView alloc]init];
    [line setBackgroundColor:COLOR_Line];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(Margin12);
        make.right.mas_equalTo(self.contentView).mas_offset(-Margin12);
        make.top.mas_equalTo(self->retweeted_statusView.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(SCALE_Height(0.5));
    }];
    
    bottomView = [[UIView alloc]init];
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(line.mas_bottom).mas_offset(0);
        make.height.mas_equalTo(SCALE_Height(25));
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
    repostBtn.titleLabel.font =REGULARFONT( FONT_12);
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
    commentBtn.titleLabel.font =REGULARFONT( FONT_12);
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
    [attitudeBtn setImage:[UIImage imageNamed:@"attitude_clicked_icon"] forState:UIControlStateSelected];
    [attitudeBtn setTitleColor:COLOR_StatusBottom forState:UIControlStateNormal];
    [attitudeBtn setTitleColor:COLOR_Emphasize forState:UIControlStateSelected];
    [attitudeBtn addTarget:self action:@selector(attitude:) forControlEvents:UIControlEventTouchUpInside];
    [attitudeView addSubview:attitudeBtn];
    [attitudeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(attitudeView);
    }];
    
}

- (void)setData:(StatusModel *)statusData{
    
    [avatar_ImgView sd_setImageWithURL:[NSURL URLWithString:statusData.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
    name_Lab.text = statusData.user.screen_name;
    creatTime_Lab.text = [NSString stringWithFormat:@"%@ ",statusData.created_at];
    [text_Lab setText:statusData.text];
    
    CGFloat width = (KScreenWidth -Margin12*2 - 6)/3;
    CGFloat height = 0;
    if(statusData.pic_urls.count == 0){
        height = 0;
    }else if(statusData.pic_urls.count <= 3 && statusData.pic_urls.count > 0){
        height = width;
    }else if(statusData.pic_urls.count <= 6 && statusData.pic_urls.count > 3){
        height = width*2 + 3;
    }else if(statusData.pic_urls.count <= 9 && statusData.pic_urls.count > 6){
        height = width*3 + 6;
    }else{
        height = 0;
    }
    
    if(statusData.pic_urls.count > 0){
        [self->picView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
        pic_collectionView = [[StatusPicCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-Margin12*2, height) itemSize:CGSizeMake(width, width) withImageArr:statusData.pic_urls withIdentifier:statusData.idstr];
        [self->picView addSubview:pic_collectionView];
    }else{
        [self->picView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
            make.top.mas_equalTo(self->text_Lab.mas_bottom).mas_offset(0);
        }];
    }
    
    
    if(statusData.retweeted_status){
        NSString *name = statusData.retweeted_status.user.screen_name;
        [text_Lab1 setText:[NSString stringWithFormat:@"@%@:%@",name, statusData.retweeted_status.text]];
        
//        if(statusData.retweeted_status.pic_urls.count > 0){
//            [self->picView1 mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.height.mas_equalTo(height);
//            }];
//            pic_collectionView1 = [[StatusPicCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-Margin12*2, height) itemSize:CGSizeMake(width, width) withImageArr:statusData.retweeted_status.pic_urls withIdentifier:statusData.retweeted_status.idstr];
//            [self->picView1 addSubview:pic_collectionView1];
//        }else{
//            [self->picView1 mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.height.mas_equalTo(0);
//                make.top.mas_equalTo(self->text_Lab1.mas_bottom).mas_offset(0);
//            }];
//        }
    }else{
        [retweeted_statusView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
            make.top.mas_equalTo(self->picView.mas_bottom).mas_offset(0);
        }];
    }
    
    
    NSString *repostTitle = statusData.reposts_count>0?[NSString stringWithFormat:@"%ld", (long)statusData.reposts_count]:@"转发";
    NSString *commentTitle = statusData.comments_count>0?[NSString stringWithFormat:@"%ld", (long)statusData.comments_count]:@"评论";
    NSString *attitudeTitle = statusData.attitudes_count>0?[NSString stringWithFormat:@"%ld", (long)statusData.attitudes_count]:@"点赞";
    [repostBtn setTitle:repostTitle forState:UIControlStateNormal];
    [commentBtn setTitle:commentTitle forState:UIControlStateNormal];
    [attitudeBtn setTitle:attitudeTitle forState:UIControlStateNormal];
}


#pragma mark - action
// 点赞
- (void)attitude:(UIButton*)sender{
    [sender setSelected:!sender.selected];
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
