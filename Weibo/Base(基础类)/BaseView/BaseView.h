//
//  BaseView.h
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseView : UIView

/**
 创建UI 默认调用 需要重写
 */
- (void)initUI;
///添加到父视图
- (void)initUIAfterMoveToSuperView;

@end

NS_ASSUME_NONNULL_END
