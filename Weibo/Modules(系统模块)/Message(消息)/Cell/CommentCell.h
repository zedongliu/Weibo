//
//  CommentCell.h
//  Weibo
//
//  Created by Zedong on 2018/12/29.
//  Copyright © 2018年 liuzedong. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CommentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentCell : BaseTableViewCell

-(void)setCommentData:(CommentModel*) commentData;

@end

NS_ASSUME_NONNULL_END
