//
//  Comments_ToMe.h
//  Weibo
//
//  Created by Zedong on 2018/12/29.
//  Copyright © 2018年 liuzedong. All rights reserved.
//

#import "BaseModel.h"
#import "CommentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comments_ToMe : BaseModel

@property(nonatomic,strong) NSMutableArray *comments;

@end

NS_ASSUME_NONNULL_END
