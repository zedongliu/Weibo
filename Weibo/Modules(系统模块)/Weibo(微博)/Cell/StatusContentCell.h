//
//  StatusContentCell.h
//  Weibo
//
//  Created by Zedong on 2019/1/3.
//  Copyright © 2019年 liuzedong. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "StatusModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusContentCell : BaseTableViewCell

- (void)setStatusData:(StatusModel*) statusData;

@end

NS_ASSUME_NONNULL_END
