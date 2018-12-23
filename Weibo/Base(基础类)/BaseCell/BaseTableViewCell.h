//
//  BaseTableViewCell.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell

///创建UI 默认调用 需要重写
- (void)initUI;

@end

NS_ASSUME_NONNULL_END
