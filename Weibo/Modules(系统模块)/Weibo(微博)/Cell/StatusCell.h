//
//  StatusCell.h
//  Weibo
//
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "StatusModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusCell : BaseTableViewCell

- (void)setData:(StatusModel*) statusData;

@end

NS_ASSUME_NONNULL_END
