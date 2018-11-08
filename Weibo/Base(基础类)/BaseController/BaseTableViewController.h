//
//  BaseTableViewController.h
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) BaseTableView *tableView;
@property (nonatomic, strong) NSArray *arrDataSource;

- (void)initData;
- (void)initUI;
///主动下拉刷新
- (void)beginHeaderRefresh;

/**
 创建底部按钮 默认事件actionClickBottomBtn
 
 @param blockConstruct <#blockConstruct description#>
 */
- (void)initBottomButton:(void(^)(UIButton *btn))blockConstruct;
- (void)actionClickBottomBtn:(UIButton *)sender;
@property (nonatomic, strong) UIButton *btnBaseBottom;

/**
 删除某行
 
 @param type 0 删除row 1 删除section
 @param obj <#obj description#>
 */
- (void)deleteCell:(NSInteger)type withObj:(id)obj;


/**
 顶部提示框
 
 @param strTips 为空隐藏，不为空展示
 */
- (UILabel *)showTopAlertTip:(NSString *)strTips;


///右侧事件
- (void)touchButtonRight:(UIBarButtonItem *)sender;
///初始化右侧 type 0 对勾 1”保存“文字 2"删除"文字 3"相册"文字
- (void)initRightView:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
