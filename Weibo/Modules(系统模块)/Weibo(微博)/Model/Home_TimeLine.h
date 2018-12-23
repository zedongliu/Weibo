//
//  Home_TimeLine.h
//  Weibo
//
//  Created by liuzedong on 2018/12/22.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseModel.h"
#import "StatusModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Home_TimeLine : BaseModel

@property(nonatomic,strong) NSMutableArray *statuses;

@end

NS_ASSUME_NONNULL_END
