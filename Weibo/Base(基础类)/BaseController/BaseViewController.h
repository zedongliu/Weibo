//
//  BaseViewController.h
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

typedef void (^BlockConstruction)(__kindof BaseViewController *vc);
/**
 StoryBoard、xib推到下一页 目前需要保证类名正确，否则闪退
 
 @param strSBXibName <#strSBXibName description#>
 @param strVCName <#strVCName description#>
 @param blockConstruction <#blockConstruction description#>
 */
- (void)pushByStoryBoardOrNib:(NSString *)strSBXibName
                         ToVC:(NSString *)strVCName
             withConstruction:(BlockConstruction)blockConstruction;
/**
 推到下一页
 
 @param strVCName 类名
 @param blockConstruction 构造vc
 */
- (void)pushToVC:(NSString *)strVCName
withConstruction:(BlockConstruction)blockConstruction;

/**
 推到下一页，并且移除部分页面
 
 @param config 类名（string）、剩余页面数量（nsnumber)
 @param strVCName <#strVCName description#>
 @param blockConstruction <#blockConstruction description#>
 */
- (void)pushWithBackConfig:(id)config
                      toVC:(NSString *)strVCName
          withConstruction:(BlockConstruction)blockConstruction;

/**
 弹出页面
 
 @param strVCName 类名
 @param blockConstruction 构造vc
 */
- (void)presentVC:(NSString *)strVCName
 withConstruction:(BlockConstruction)blockConstruction;


/**
 返回之前页
 
 @param config 为空则返回一页 返回到类名（string）、返回到剩余页面数量（nsnumber)
 @param blockConstruction 展示页面操作
 */
- (void)popBackWithConfig:(id)config
         withConstruction:(BlockConstruction)blockConstruction;


//navigationbar items
///返回事件
- (void)back;
///直接返回上一页
- (void)popBack;
///操作回调
@property (nonatomic, copy) void(^blockOperationCallBack)(NSInteger index,id obj);

#pragma mark -  添加下拉刷新
/**
 添加下拉刷新
 @param tableView 需要添加的tableview
 */
- (void)addRefreshHeader:(UITableView *)tableView;
///添加上拉
- (void)addRefreshFooter:(UITableView *)tableView;
///获取基础数据 通用方法
- (void)getBaseDataMethod;
- (void)getMoreDataMethod;
///上下拉页码
@property (nonatomic, assign) NSUInteger pageBase;
@property (nonatomic, strong) UIScrollView *scrollViewBase;//当前页面刷新视图
///停止刷新
- (void)stopRefresh;

#pragma mark - 加载视图


#pragma mark -

///基础参数
@property (nonatomic, assign) NSInteger baseType;
@property (nonatomic, strong) id baseModel;
@property (nonatomic, assign) BOOL isNeedNavLine;//是否不需要顶栏黑线 默认NO
@property (nonatomic, strong) id object;
/** 是否隐藏导航栏 */
@property (nonatomic, assign) BOOL isHiddenNav;


//再定义一个imageview来等同于这个黑线
@property (nonatomic, weak) UIImageView *navBarHairlineImageView;;
/**
 隐藏顶部的黑线
 */
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view;

///弹出提示alert
- (void)showErrorAlertControllerWithMessage:(NSString *)message;


//错误提示
-(void)showToast:(NSString *)str withTime:(CGFloat)time;


/** 网络出错提示 */
@property (nonatomic, strong) UILabel *wrongTipLabel;
/** 网络出错提示图片 */
@property (nonatomic, strong) UIImageView *wrongTipImageV;
/** 网络出错按钮 */
@property (nonatomic, strong) UIButton *wrongBtn;
/** 点击网络出错按钮 */
- (void)touchButtonWrong:(UIButton *)sender;


/**
 左上角返回键
 
 @param type 0 默认返回 1 叉叉 2白色返回
 */
- (void)initNaviLeftButton:(NSInteger)type;

/**
 创建navi右侧按钮
 
 @param strTitle <#strTitle description#>
 */
- (void)initNaviRightTitle:(NSString *)strTitle;

/**
 创建navi右侧背景按钮
 
 @param strTitle <#strTitle description#>
 */
- (void)initNaviRightTitle:(NSString *)strTitle btnImage:(NSString*)btnIamgeName;
///是否需要返回手势 默认YES
@property (nonatomic, assign) BOOL isNeedPopBackGesture;
///右侧navi事件
- (void)touchButtonNaviRight:(UIButton *)sender;
//右侧按钮事件
- (void)touchUpRightBtn:(UIButton *)sender;

///页面展示形式 0 push 1present
@property (nonatomic, assign, readonly) NSInteger showType;
@property (nonatomic, assign, readonly) BOOL isAppeared;//是否在展示状态

#pragma mark - Overwrite

//网络状态改变 重载
- (void)networkChanged:(id)obj;
//注册监听app前后台状态改变
- (void)registerApplicationActiceStaus;
//重载 app是否在运行
- (void)applicationIsActive:(BOOL)isActive;

//获取当前的控制器
- (UIViewController *)topViewController;

//布局UI
- (void)initUI;
//初始化数据
- (void)initData;

@end

NS_ASSUME_NONNULL_END
