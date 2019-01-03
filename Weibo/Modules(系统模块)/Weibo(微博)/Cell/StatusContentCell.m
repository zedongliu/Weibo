//
//  StatusContentCell.m
//  Weibo
//
//  Created by Zedong on 2019/1/3.
//  Copyright © 2019年 liuzedong. All rights reserved.
//

#import "StatusContentCell.h"
#import "StatusPicCollectionView.h"

#import "MLEmojiLabel.h"

@interface StatusContentCell()<MLEmojiLabelDelegate,UIGestureRecognizerDelegate>{
    
    UIImageView *avatar_ImgView;
    UILabel *name_Lab;
    UILabel *creatTime_Lab;
    UILabel *source_Lab;
    
    MLEmojiLabel *text_Lab;
    
    UIView *picView;
    StatusPicCollectionView *pic_collectionView;
    
    
    
}
@end

@implementation StatusContentCell


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
    //    text_Lab.textInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    //    text_Lab.lineSpacing = 3.0f;
    
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
        make.bottom.mas_equalTo(self.contentView.mas_bottom).mas_offset(-Margin12);
    }];
    
   
}


-(void)setStatusData:(StatusModel *)statusData{
    
    [avatar_ImgView sd_setImageWithURL:[NSURL URLWithString:statusData.user.profile_image_url] placeholderImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
    name_Lab.text = statusData.user.screen_name;
    creatTime_Lab.text = [NSString stringWithFormat:@"%@ ",statusData.created_at];
    //    text_Lab.text = statusData.text;
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
    
    [self->picView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    pic_collectionView = [[StatusPicCollectionView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-Margin12*2, height) itemSize:CGSizeMake(width, width) withImageArr:statusData.pic_urls withIdentifier:statusData.idstr];
    [self->picView addSubview:pic_collectionView];
    
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
