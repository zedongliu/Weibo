//
//  CommentCell.h
//  Weibo
//
//  Created by Zedong on 2019/1/3.
//  Copyright © 2019年 liuzedong. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "CommentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentCell : BaseTableViewCell

- (void)setCommentData:(CommentModel*) commentData;

@end

NS_ASSUME_NONNULL_END
