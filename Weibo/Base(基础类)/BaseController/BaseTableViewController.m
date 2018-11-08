//
//  BaseTableViewController.m
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@property (nonatomic, strong) UILabel *lblTopShowView;

@end

@implementation BaseTableViewController
#pragma mark - LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNeedNavLine = YES;
    [self initData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)){
            make.top.mas_equalTo(KNaviHeight);
        }
        else
        {
            make.top.mas_equalTo(self.view);
        }
        
        make.left.bottom.right.mas_equalTo(self.view);
    }];
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc
{
    
}

#pragma mark - data
- (void)initData{}

#pragma mark - UI
- (void)initUI{}

#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:@"cell"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - Getter

- (BaseTableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[BaseTableView alloc]initWithFrame:self.view.frame
                                                   style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.backgroundColor = K_COLOR_MAIN_BCK;
    }
    return _tableView;
}

- (UILabel *)lblTopShowView
{
    if (!_lblTopShowView)
    {
        UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 34, KScreenWidth, 30)];
        lblTitle.font = SYSTEMFONT(14);
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.textColor = COLOR_BLACK;
        lblTitle.backgroundColor = COLOR_WHITE;
        lblTitle.numberOfLines = 0 ;
        lblTitle.hidden = YES;
        [self.view addSubview:lblTitle];
        _lblTopShowView = lblTitle;
    }
    return _lblTopShowView;
}

#pragma mark - Setter


#pragma mark - Public

- (void)initBottomButton:(void(^)(UIButton *btn))blockConstruct;
{
    //    UIView *view =[[UIView alloc]init];
    //    view.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:view];
    //    [view mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.bottom.right.mas_equalTo(self.view);
    //        make.height.mas_equalTo(65);
    //    }];
    //
    //    UIButton *btn = [[UIButton alloc]init];
    //    [btn setTitleColor:COLOR_WHITE
    //              forState:UIControlStateNormal];
    //    [btn setBackgroundImage:[UIImage imageWithColor:[K_COLOR_MAIN_RED]]
    //                   forState:UIControlStateNormal];
    //    btn.titleLabel.font = SYSTEMFONT(17);
    //    self.tableView.height -= 65;
    //
    //    [btn addTarget:self
    //            action:@selector(actionClickBottomBtn:)
    //  forControlEvents:UIControlEventTouchUpInside];
    //    btn.layer.cornerRadius = 5;
    //    btn.layer.masksToBounds = YES;
    //    [view addSubview:btn];
    //    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.mas_equalTo(view).insets(UIEdgeInsetsMake(10, 20, 10, 20));
    //    }];
    //    self.btnBaseBottom = btn;
    //    if (blockConstruct)
    //    {
    //        blockConstruct(btn);
    //    }
}

- (void)actionClickBottomBtn:(UIButton *)sender
{
    
}

- (void)deleteCell:(NSInteger)type withObj:(id)obj
{
    //    NSMutableArray *marrData = self.arrDataSource.mutableCopy;
    //    NSInteger index = [marrData indexOfObject:obj];
    //    [marrData removeObject:obj];
    //    self.arrDataSource = marrData.copy;
    //
    //    [self.tableView beginUpdates];
    //    if (type == 0)
    //    {
    //        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:index]]
    //                              withRowAnimation:UITableViewRowAnimationAutomatic];
    //    }
    //    else
    //    {
    //        [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:index]
    //                      withRowAnimation:UITableViewRowAnimationAutomatic];
    //    }
    //    [self.tableView endUpdates];
    //
    //    if (self.arrDataSource.count == 0)
    //    {
    //        self.tableView.viewNoData.hidden = NO;
    //    }
}

- (UIView *)showTopAlertTip:(NSString *)strTips
{
    //    if (strTips.length > 0)
    //    {
    //        self.lblTopShowView.text = strTips;
    //        self.lblTopShowView.hidden = NO;
    //        self.lblTopShowView.frame = CGRectMake(0, 30, KScreenWidth, 35);
    //        [UIView animateWithDuration:0.5
    //                         animations:^{
    //                             self.lblTopShowView.top = KNaviHeight;
    //                         } completion:^(BOOL finished) {
    //
    //                         }];
    //    }
    //    else
    //    {
    //        [UIView animateWithDuration:0.5
    //                         animations:^{
    //                             self.lblTopShowView.top = 30;
    //                         } completion:^(BOOL finished) {
    //                             self.lblTopShowView.hidden = YES;
    //                         }];
    //    }
    return self.lblTopShowView;
}

- (void)addRefreshHeader:(UITableView *)tableView
{
    if (!tableView)
    {
        tableView = self.tableView;
    }
    [super addRefreshHeader:tableView];
}

- (void)addRefreshFooter:(UITableView *)tableView
{
    if (!tableView)
    {
        tableView = self.tableView;
    }
    [super addRefreshFooter:tableView];
}

///初始化右侧对勾
- (void)initRightView:(NSInteger)type
{
    switch (type)
    {
        case 0:
        {
            //right save icon_save
            UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[IMAGENAMED(@"icon_save") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                         style:UIBarButtonItemStylePlain target:self action:@selector(touchButtonRight:)];
            rightItem.tintColor = COLOR_NAV_TITLE;
            self.navigationItem.rightBarButtonItem = rightItem;
        }
            break;
        case 1:
        case 2:
        {
            UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:type == 1 ? @"保存" : @"删除"
                                                                         style:UIBarButtonItemStyleDone
                                                                        target:self
                                                                        action:@selector(touchButtonRight:)];
            rightItem.tintColor = [UIColor redColor];//K_COLOR_MAIN_RED;
            self.navigationItem.rightBarButtonItem = rightItem;
        }
            break;
        case 3:
        {
            UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"相册"
                                                                         style:UIBarButtonItemStyleDone
                                                                        target:self
                                                                        action:@selector(touchButtonRight:)];
            rightItem.tintColor = COLOR_WHITE;
            self.navigationItem.rightBarButtonItem = rightItem;
        }
            break;
        default:
            break;
    }
}

///右侧事件
- (void)touchButtonRight:(UIBarButtonItem *)sender{}

///主动下拉刷新
- (void)beginHeaderRefresh
{
    //    [self.tableView.mj_header beginRefreshing];
}



@end
