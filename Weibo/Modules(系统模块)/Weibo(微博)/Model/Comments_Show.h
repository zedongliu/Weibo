//
//  Comments_Show.h
//  Weibo
//
//  Created by Zedong on 2019/1/3.
//  Copyright © 2019年 liuzedong. All rights reserved.
//

#import "BaseModel.h"
#import "CommentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comments_Show : BaseModel

@property(nonatomic,strong) NSMutableArray *comments;

@end

NS_ASSUME_NONNULL_END
