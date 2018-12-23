//
//  CommentModel.h
//  Weibo
//  评论对象数据结构
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseModel.h"
#import "StatusModel.h"
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentModel : BaseModel

@property (nonatomic,strong) NSString *created_at;      // 评论创建时间
@property (nonatomic,assign) NSInteger id;              // 评论的ID
@property (nonatomic,strong) NSString *text;            // 评论的内容
@property (nonatomic,strong) NSString *source;          // 评论的来源
@property (nonatomic,strong) UserModel *user;           // 评论作者的用户信息字段
@property (nonatomic,assign) NSInteger mid;             // 评论的MID
@property (nonatomic,strong) NSString *idstr;           // 字符串型的评论ID
@property (nonatomic,strong) StatusModel *status;       // 评论的微博信息字段
@property (nonatomic,strong) NSObject *reply_comment;   // 评论来源评论，当本评论属于对另一评论的回复时返回此字段



@end

NS_ASSUME_NONNULL_END
