//
//  StatusDetailVC.h
//  Weibo
//
//  Created by Zedong on 2019/1/3.
//  Copyright © 2019年 liuzedong. All rights reserved.
//

#import "BaseTableViewController.h"
#import "StatusModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusDetailVC : BaseTableViewController

@property(nonatomic,strong) StatusModel *statusData;

@end

NS_ASSUME_NONNULL_END
