//
//  RemindModel.h
//  Weibo
//  消息未读数
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RemindModel : BaseModel


@property (nonatomic,assign) NSInteger status;              //    新微博未读数
@property (nonatomic,assign) NSInteger follower;            //    新粉丝数
@property (nonatomic,assign) NSInteger cmt;                 //    新评论数
@property (nonatomic,assign) NSInteger dm;                  //    新私信数
@property (nonatomic,assign) NSInteger mention_status;      //    新提及我的微博数
@property (nonatomic,assign) NSInteger mention_cmt;         //    新提及我的评论数
@property (nonatomic,assign) NSInteger group;               //    微群消息未读数
@property (nonatomic,assign) NSInteger private_group;       //    私有微群消息未读数
@property (nonatomic,assign) NSInteger notice;              //    新通知未读数
@property (nonatomic,assign) NSInteger invite;              //    新邀请未读数
@property (nonatomic,assign) NSInteger badge;               //    新勋章数
@property (nonatomic,assign) NSInteger photo ;              //    相册消息未读数
@property (nonatomic,assign) NSInteger msgbox;              //    {{{3}}}


@end

NS_ASSUME_NONNULL_END
