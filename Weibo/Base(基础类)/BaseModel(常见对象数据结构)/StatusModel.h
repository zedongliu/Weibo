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

/**
 *  微博昵称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  微博头像
 */
@property (nonatomic, strong) NSString *profile_image_url;
/** 会员类型 > 2代表是会员 */
@property (nonatomic, assign) NSInteger mbtype;
/** 会员等级 */
@property (nonatomic, assign) NSInteger mbrank;
@property (nonatomic, assign,getter=isVip) BOOL vip;
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
//@property (nonatomic,strong) StatusModel *retweeted_status;     // 被转发的原微博信息字段，当该微博为转发微博时返回
@property (nonatomic,assign) NSInteger reposts_count;           // 转发数
//@property (nonatomic,assign) NSInteger *comments_count;         // 评论数
//@property (nonatomic,assign) NSInteger *attitudes_count;        // 表态数

//    微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
@property (nonatomic,strong) NSObject *visible;
//    微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
@property (nonatomic,strong) NSObject *pic_ids;
//    微博流内的推广微博ID
@property (nonatomic,strong) NSObject *ad;

@end

NS_ASSUME_NONNULL_END
