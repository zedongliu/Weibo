//
//  StatusModel.h
//  Weibo
//  微博对象数据结构
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//


//地址：https://open.weibo.com/wiki/%E5%B8%B8%E8%A7%81%E8%BF%94%E5%9B%9E%E5%AF%B9%E8%B1%A1%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84#.E5.BE.AE.E5.8D.9A.EF.BC.88status.EF.BC.89

#import "BaseModel.h"
#import "GeoModel.h"
//#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : BaseModel

@property (nonatomic,assign) NSInteger id;                  //    用户UID
@property (nonatomic,strong) NSString *idstr;               //    字符串型的用户UID
@property (nonatomic,strong) NSString *screen_name;         //    用户昵称
@property (nonatomic,strong) NSString *name;                //    友好显示名称
@property (nonatomic,assign) NSInteger province;            //    用户所在省级ID
@property (nonatomic,assign) NSInteger city;                //    用户所在城市ID
@property (nonatomic,strong) NSString *location;            //    用户所在地
//@property (nonatomic,strong) NSString *description;         //    用户个人描述
@property (nonatomic,strong) NSString *url;                 //    用户博客地址
@property (nonatomic,strong) NSString *profile_image_url;   //    用户头像地址（中图），50×50像素
@property (nonatomic,strong) NSString *profile_url;         //    用户的微博统一URL地址
@property (nonatomic,strong) NSString *domain;              //    用户的个性化域名
@property (nonatomic,strong) NSString *weihao ;             //    用户的微号
@property (nonatomic,strong) NSString *gender;              //    性别，m：男、f：女、n：未知
@property (nonatomic,assign) NSInteger followers_count;     //    粉丝数
@property (nonatomic,assign) NSInteger friends_count;       //    关注数
@property (nonatomic,assign) NSInteger statuses_count;      //    微博数
@property (nonatomic,assign) NSInteger favourites_count;    //    收藏数
@property (nonatomic,strong) NSString *created_at;          //    用户创建（注册）时间
//@property (nonatomic,assign) Boolean following;           //    暂未支持
@property (nonatomic,assign) Boolean allow_all_act_msg;     //    是否允许所有人给我发私信，true：是，false：否
@property (nonatomic,assign) Boolean geo_enabled;           //    是否允许标识用户的地理位置，true：是，false：否
@property (nonatomic,assign) Boolean verified;              //    是否是微博认证用户，即加V用户，true：是，false：否
@property (nonatomic,assign) NSInteger verified_type;       //    暂未支持
@property (nonatomic,strong) NSString *remark;              //    用户备注信息，只有在查询用户关系时才返回此字段
//@property (nonatomic,strong) StatusModel *status;           //    用户的最近一条微博信息字段 详细
@property (nonatomic,assign) Boolean allow_all_comment;     //    是否允许所有人对我的微博进行评论，true：是，false：否
@property (nonatomic,strong) NSString *avatar_large;        //    用户头像地址（大图），180×180像素
@property (nonatomic,strong) NSString *avatar_hd;           //    用户头像地址（高清），高清头像原图
@property (nonatomic,strong) NSString *verified_reason;     //    认证原因
@property (nonatomic,assign) Boolean follow_me;             //    该用户是否关注当前登录用户，true：是，false：否
@property (nonatomic,assign) NSInteger online_status;       //    用户的在线状态，0：不在线、1：在线
@property (nonatomic,assign) NSInteger bi_followers_count;  //    用户的互粉数
@property (nonatomic,strong) NSString *lang;                //    用户当前的语言版本，zh-cn：简体中文，zh-tw：繁体中文，en：英语

@end



@interface Pic_Url : BaseModel

@property (nonatomic,strong) NSString *thumbnail_pic;

@end



@interface RetweetedStatus : BaseModel

@property (nonatomic,strong) NSString *created_at;              // 微博创建时间
@property (nonatomic,assign) NSInteger id;                      // 微博ID
@property (nonatomic,assign) NSInteger mid;                     // 微博MID
@property (nonatomic,strong) NSString *idstr;                   // 字符串型的微博ID
@property (nonatomic,strong) NSString *text;                    // 微博信息内容
@property (nonatomic,strong) NSString *source;                  // 微博来源
@property (nonatomic,assign) Boolean favorited;                 // 是否已收藏，true：是，false：否
@property (nonatomic,assign) Boolean truncated;                 // 是否被截断，true：是，false：否
@property (nonatomic,strong) NSString *thumbnail_pic;           // 缩略图片地址，没有时不返回此字段
@property (nonatomic,strong) NSString *bmiddle_pic;             // 中等尺寸图片地址，没有时不返回此字段
@property (nonatomic,strong) NSString *original_pic;            // 原始图片地址，没有时不返回此字段
@property (nonatomic,strong) GeoModel *geo;                     // 地理信息字段
@property (nonatomic,strong) User *user;                        // 微博作者的用户信息字段
@property (nonatomic,assign) NSInteger reposts_count;           // 转发数
@property (nonatomic,assign) NSInteger comments_count;          // 评论数
@property (nonatomic,assign) NSInteger attitudes_count;         // 表态数
//    微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
@property (nonatomic,strong) NSObject *visible;
//    微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
@property (nonatomic,strong) NSObject *pic_ids;
//    微博流内的推广微博ID
@property (nonatomic,strong) NSObject *ad;

@end


@interface StatusModel : BaseModel


@property (nonatomic,strong) NSString *created_at;              // 微博创建时间
@property (nonatomic,assign) NSInteger id;                      // 微博ID
@property (nonatomic,assign) NSInteger mid;                     // 微博MID
@property (nonatomic,strong) NSString *idstr;                   // 字符串型的微博ID
@property (nonatomic,strong) NSString *text;                    // 微博信息内容
@property (nonatomic,strong) NSString *source;                  // 微博来源
@property (nonatomic,assign) Boolean favorited;                 // 是否已收藏，true：是，false：否
@property (nonatomic,assign) Boolean truncated;                 // 是否被截断，true：是，false：否
@property (nonatomic,strong) NSString *thumbnail_pic;           // 缩略图片地址，没有时不返回此字段
@property (nonatomic,strong) NSString *bmiddle_pic;             // 中等尺寸图片地址，没有时不返回此字段
@property (nonatomic,strong) NSString *original_pic;            // 原始图片地址，没有时不返回此字段
@property (nonatomic,strong) GeoModel *geo;                     // 地理信息字段
@property (nonatomic,strong) User *user;                        // 微博作者的用户信息字段
@property (nonatomic,strong) RetweetedStatus *retweeted_status;     // 被转发的原微博信息字段，当该微博为转发微博时返回
@property (nonatomic,assign) NSInteger reposts_count;           // 转发数
@property (nonatomic,assign) NSInteger comments_count;          // 评论数
@property (nonatomic,assign) NSInteger attitudes_count;         // 表态数

//    微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
@property (nonatomic,strong) NSObject *visible;
//    微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
@property (nonatomic,strong) NSArray<Pic_Url*> *pic_urls;
//    微博流内的推广微博ID
@property (nonatomic,strong) NSObject *ad;

@end

NS_ASSUME_NONNULL_END
