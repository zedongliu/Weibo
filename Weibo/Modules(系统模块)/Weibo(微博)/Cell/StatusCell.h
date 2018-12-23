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

@property(nonatomic,strong)StatusModel *statusData;
@property(nonatomic,strong)UILabel *text_Lab;

@end

NS_ASSUME_NONNULL_END
