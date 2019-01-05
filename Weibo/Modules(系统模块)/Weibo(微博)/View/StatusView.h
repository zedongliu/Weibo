//
//  StatusView.h
//  Weibo
//
//  Created by liuzedong on 2019/1/5.
//  Copyright © 2019 liuzedong. All rights reserved.
//

#import "BaseView.h"
#import "StatusModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusView : BaseView

- (instancetype)initWithFrame:(CGRect)frame withStatusData:(StatusModel *)statusData;

@end

NS_ASSUME_NONNULL_END
