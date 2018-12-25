//
//  BaseViewController.m
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseViewController.h"
#import "RefreshHeaderView.h"
#import "MJRefreshBackNormalFooter.h"

@interface BaseViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isNeedPopBackGesture = YES;
    
    self.navigationController.navigationBar.backgroundColor = COLOR_WHITE;
    
    NSLog(@"\n==============\n当前VC:%@\n==============",NSStringFromClass([self class]));
    self.navigationController.delegate = self;
    self.view.backgroundColor = K_COLOR_MAIN_BCK;
    [self initData];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"\n=======\ndidReceiveMemoryWarning %@\n=======",NSStringFromClass([self class]));
}

- (void)dealloc
{
    [SVProgressHUD dismiss];
    self.navigationController.delegate = nil;
    
    NSLog(@"\n=======\ndealloc %@\n=======",NSStringFromClass([self class]));
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //    NSLog(@"isNeedNavLine %d",self.isNeedNavLine);
    [self findHairlineImageViewUnder:self.navigationController.navigationBar].hidden = !self.isNeedNavLine;
    
    _isAppeared = YES;
    
//    [MobClick beginLogPageView:NSStringFromClass([self class])];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    _isAppeared = NO;
    
//    [MobClick endLogPageView:NSStringFromClass([self class])];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - public

/**
 StoryBoard推到下一页
 
 @param strVCName 类名
 @param blockConstruction 构造vc
 */
- (void)pushByStoryBoardOrNib:(NSString *)strSBXibName
                         ToVC:(NSString *)strVCName
             withConstruction:(BlockConstruction)blockConstruction
{
    BaseViewController *vc;
    UIStoryboard *sb;
    @try {
        sb = [UIStoryboard storyboardWithName:strSBXibName
                                       bundle:nil];
    } @catch (NSException *exception) {
        
    } @finally {
        if (sb)
        {
            vc = [sb instantiateViewControllerWithIdentifier:strVCName];
        }
    }
    
    if (!vc)
    {
        ///从xib获取
        Class class = NSClassFromString(strSBXibName);
        if (!class)
        {
            return;
        }
        @try {
            vc = [[class alloc]initWithNibName:strSBXibName bundle:nil];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }
    
    //获取不到
    if (!vc)
    {
        return;
    }
    
    vc.hidesBottomBarWhenPushed = YES;
    if (blockConstruction)
    {
        blockConstruction(vc);
    }
    [self.navigationController pushViewController:vc
                                         animated:YES];
    
    
}

- (void)pushToVC:(NSString *)strVCName
withConstruction:(BlockConstruction)blockConstruction
{
    if (strVCName.length == 0)
    {
        return;
    }
    Class class = NSClassFromString(strVCName);
    if (!class)
    {
        return;
    }
    BaseViewController *vc = [class new];
    if (![vc isKindOfClass:[BaseViewController class]])
    {
        [self.navigationController pushViewController:vc
                                             animated:YES];
        return;
    }
    vc.hidesBottomBarWhenPushed = YES;
    if (blockConstruction)
    {
        blockConstruction(vc);
    }
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

- (void)presentVC:(NSString *)strVCName withConstruction:(BlockConstruction)blockConstruction
{
    if (strVCName.length == 0)
    {
        return;
    }
    Class class = NSClassFromString(strVCName);
    if (!class)
    {
        return;
    }
    BaseViewController *vc = [class new];
    if (![vc isKindOfClass:[BaseViewController class]])
    {
        return;
    }
    vc.hidesBottomBarWhenPushed = YES;
    if (blockConstruction)
    {
        blockConstruction(vc);
    }
    [self.navigationController presentViewController:[[BaseNavigationController alloc]initWithRootViewController:vc] animated:YES
                                          completion:nil];
}

- (void)pushWithBackConfig:(id)config
                      toVC:(NSString *)strVCName
          withConstruction:(BlockConstruction)blockConstruction
{
    [self pushToVC:strVCName
  withConstruction:blockConstruction];
    
    if ([config isKindOfClass:[NSString class]])
    {
        NSMutableArray *marrVCs = [NSMutableArray array];
        [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [marrVCs addObject:obj];
            if ([NSStringFromClass([obj class]) isEqualToString:config])
            {
                *stop = YES;
            }
        }];
        UIViewController *vcLast = self.navigationController.viewControllers.lastObject;
        if (![marrVCs containsObject:vcLast])
        {
            [marrVCs addObject:vcLast];
        }
        self.navigationController.viewControllers = marrVCs.copy;
    }
    else if ([config isKindOfClass:[NSNumber class]])
    {
        NSUInteger count = [config integerValue];
        if (count < self.navigationController.viewControllers.count)
        {
            NSMutableArray *marrVCs = [self.navigationController.viewControllers subarrayWithRange:NSMakeRange(0, count)].mutableCopy;
            
            [marrVCs addObject:self.navigationController.viewControllers.lastObject];
            self.navigationController.viewControllers = marrVCs.copy;
        }
    }
}

/**
 返回之前页
 
 @param config 为空则返回一页 类名（string）、剩余页面数量（nsnumber)
 @param blockConstruction 展示页面操作
 */
- (void)popBackWithConfig:(id)config
         withConstruction:(void (^)(id vc))blockConstruction
{
    if (!config)
    {
        [self back];
        return;
    }
    
    __block BaseViewController *vcPopBack;
    if ([config isKindOfClass:[NSString class]])
    {
        [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             if ([NSStringFromClass(obj.class) isEqualToString:config])
             {
                 vcPopBack = obj;
                 *stop = YES;
             }
         }];
    }
    else if ([config isKindOfClass:[NSNumber class]])
    {
        NSUInteger count = [config integerValue];
        if (count == 0)
        {
            [self back];
            return;
        }
        
        if (count < self.navigationController.viewControllers.count)
        {
            vcPopBack = self.navigationController.viewControllers[count - 1];
        }
    }
    
    if (vcPopBack)
    {
        if (blockConstruction)
        {
            blockConstruction(vcPopBack);
        }
        [self.navigationController popToViewController:vcPopBack
                                              animated:YES];
    }
}

- (void)back
{
    [SVProgressHUD dismiss];
    [self popBack];
}

- (void)popBack
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = false;
}

- (UIImageView *)navBarHairlineImageView
{
    if (!_navBarHairlineImageView)
    {
        _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    }
    return _navBarHairlineImageView;
}

//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

///获取返回手势
- (UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer
{
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = nil;
    if (self.navigationController.view.gestureRecognizers.count > 0)
    {
        for (UIGestureRecognizer *recognizer in self.navigationController.view.gestureRecognizers)
        {
            if ([recognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]])
            {
                screenEdgePanGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)recognizer;
                break;
            }
        }
    }
    return screenEdgePanGestureRecognizer;
}

///弹出提示alert
//- (void)showErrorAlertControllerWithMessage:(NSString *)message
//{
//    [UIAlertController showAlertInViewController:self
//                                       withTitle:@"提示"
//                                         message:message
//                               cancelButtonTitle:@"确定"
//                          destructiveButtonTitle:nil
//                               otherButtonTitles:nil
//                                        tapBlock:^(UIAlertController * _Nonnull controller, UIAlertAction * _Nonnull action, NSInteger buttonIndex) {
//                                            [self back];
//                                        }];
//}


//toast
-(void)showToast:(NSString *)str withTime:(CGFloat)time
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = str;
    HUD.label.textColor = COLOR_WHITE;
    
    HUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    HUD.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    //指定距离中心点的X轴和Y轴的位置，不指定则在屏幕中间显示
    
    [HUD setOffset:CGPointMake(0, -100)];
    
    [HUD showAnimated:YES];
    
    [HUD hideAnimated:YES afterDelay:time];
    
}

/**
 左上角返回键
 
 @param type 0 默认返回 1 叉叉 2白色返回
 */
- (void)initNaviLeftButton:(NSInteger)type
{
    if (!self.navigationItem.leftBarButtonItem)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[IMAGENAMED(@"icon_back") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                                style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
    
    switch (type)
    {
        case 0:
        {
            self.navigationItem.leftBarButtonItem.image =  [IMAGENAMED(@"icon_back") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.isNeedPopBackGesture = YES;
        }
            break;
        case 1:
        {
            self.navigationItem.leftBarButtonItem.image =  [IMAGENAMED(@"icon_cancel") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.isNeedPopBackGesture = NO;
        }
            break;
        case 2:
        {
            self.navigationItem.leftBarButtonItem.image =  [IMAGENAMED(@"icon_scan_back") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.isNeedPopBackGesture = YES;
        }
            break;
            
        default:
            break;
    }
}


/**
 创建navi右侧按钮
 
 @param strTitle <#strTitle description#>
 */
- (void)initNaviRightTitle:(NSString *)strTitle
{
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc]initWithTitle:strTitle
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self action:@selector(touchButtonNaviRight:)];
    itemRight.tintColor = COLOR_NAV_TITLE;
    [itemRight setTitleTextAttributes:@{
                                        NSFontAttributeName:SYSTEMFONT(13)
                                        }
                             forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = itemRight;
}

/**
 创建navi右侧按钮
 
 @param strTitle <#strTitle description#>
 */
- (void)initNaviRightTitle:(NSString *)strTitle btnImage:(NSString *)btnIamgeName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = SYSTEMFONT(13);
    btn.frame = CGRectMake(0, 0, 40, 40);
    if (![NSString judgeIsNone:strTitle]) {
        [btn setTitle:strTitle forState:UIControlStateNormal];
    }
    [btn setTitleColor:COLOR_NAV_TITLE forState:UIControlStateNormal];
    if (![NSString judgeIsNone:btnIamgeName]) {
        [btn setImage:[UIImage imageNamed:btnIamgeName] forState:UIControlStateNormal];
    }
    [btn addTarget:self action:@selector(touchUpRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = itemRight;
}

//网络状态改变 重载
- (void)networkChanged:(id)obj
{
    
}

//注册监听app前后台状态改变
- (void)registerApplicationActiceStaus
{
    //绑定
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationApplicationActiveStatus:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationApplicationActiveStatus:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}

- (void)notificationApplicationActiveStatus:(NSNotification *)aNoti
{
    [self applicationIsActive:[aNoti.name isEqualToString:UIApplicationDidBecomeActiveNotification]];
}

//重载
- (void)applicationIsActive:(BOOL)isActive
{
    
}

#pragma mark -  添加下拉刷新
/**
 添加下拉刷新
 @param tableView 需要添加的tableview
 */
- (void)addRefreshHeader:(UITableView *)tableView
{
    __weak typeof(self) weakSelf = self;
    RefreshHeaderView *header = [RefreshHeaderView headerWithRefreshingBlock:^{
        weakSelf.pageBase = 1;
        [weakSelf getBaseDataMethod];
    }];
    tableView.mj_header = header;
    self.scrollViewBase = tableView;
}
///添加上拉
- (void)addRefreshFooter:(UITableView *)tableView
{
    __weak typeof(self) weakSelf = self;
    tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        weakSelf.pageBase ++;
        [weakSelf getMoreDataMethod];
    }];
    self.scrollViewBase = tableView;
}
///获取基础数据 通用方法
- (void)getBaseDataMethod{}
- (void)getMoreDataMethod{}
///停止刷新
- (void)stopRefresh
{
    if (self.scrollViewBase.mj_header.isRefreshing)
    {
        [self.scrollViewBase.mj_header endRefreshing];
    }

    if (self.scrollViewBase.mj_footer.isRefreshing)
    {
        [self.scrollViewBase.mj_footer endRefreshing];
    }
}

#pragma mark - Overwrite
- (void)initUI{
    
}

- (void)initData{
    
}

#pragma mark - Setter && Getter

- (NSInteger)showType
{
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count > 1)
    {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1] == self)
        {
            //push方式
            return 0;
        }
    }
    else
    {
        //present方式
        
    }
    return 1;
}

- (NSUInteger)pageBase
{
    if (_pageBase < 1)
    {
        _pageBase = 1;
    }
    return _pageBase;
}

#pragma mark - Actions

- (void)touchButtonNaviRight:(UIButton *)sender{
    
}

- (void)touchUpRightBtn:(UIButton *)sender{
    
}


#pragma mark - private

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.isHiddenNav) {
        // 判断要显示的控制器是否是自己
        BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
        
        [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
    }
    
}

#pragma mark - UI
- (UILabel *)wrongTipLabel{
//    if (!_wrongTipLabel) {
//        UILabel *lblTips = [[UILabel alloc]init];
//        lblTips.font = SYSTEMFONT(15);
//        lblTips.textAlignment = NSTextAlignmentCenter;
//        lblTips.textColor = COLOR_TITLE;
//        lblTips.numberOfLines = 0 ;
//        lblTips.frame = CGRectMake(0, self.view.centerY - 50, KScreenWidth, 40);
//        lblTips.centerX = self.view.centerX;
//        [self.view addSubview:lblTips];
//        _wrongTipLabel = lblTips;
//
//    }
    return _wrongTipLabel;
}
//
- (UIButton *)wrongBtn{
//    if (!_wrongBtn) {
//
//        UIButton *btn = [[UIButton alloc]init];
//        btn.titleLabel.font = SYSTEMFONT(15);
//        [btn setBackgroundColor:[UIColor whiteColor]];
//        [btn setTitleColor:K_COLOR_MAIN_RED
//                  forState:UIControlStateNormal];
//        btn.frame = CGRectMake(0, self.view.centerY, 150, 40);
//        btn.centerX = self.view.centerX;
//        btn.layer.cornerRadius = 5.0;
//        btn.layer.borderColor = K_COLOR_MAIN_RED.CGColor;
//        btn.layer.borderWidth = 1.0;
//        btn.layer.masksToBounds = true;
//        [self.view addSubview:btn];
//
//        [btn addTarget:self
//                action:@selector(touchButtonWrong:)
//      forControlEvents:UIControlEventTouchUpInside];
//
//        _wrongBtn = btn;
//
//    }
    return _wrongBtn;
}

- (void)touchButtonWrong:(UIButton *)sender{
    
}

- (UIImageView *)wrongTipImageV{
    if (!_wrongTipImageV) {
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.view addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.wrongTipLabel.mas_top).mas_offset(-30);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(90);
            make.centerX.mas_equalTo(self.view);
        }];
        imageV.image = [UIImage imageNamed:@"icon_home_nonetwork"];
        _wrongTipImageV = imageV;
    }
    return _wrongTipImageV;
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
