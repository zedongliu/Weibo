//
//  WeiboRootViewController.m
//  Weibo
//
//  Created by liuzedong on 2018/12/19.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "WeiboRootVC.h"
#import "Home_TimeLine.h"
#import "StatusCell.h"

#import "RefreshHeaderView.h"

@interface WeiboRootVC (){
    Home_TimeLine  *homeTimeLineData;
    NSInteger currentPageNumber;
    NSMutableArray <StatusModel*> *statusData;
}
@property(nonatomic,strong)UILabel *text_Lab;

@end

@implementation WeiboRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self->currentPageNumber = 1;
    
    [self setDataWithPage:self->currentPageNumber];
    [self setUI];
}

- (void)setDataWithPage:(NSInteger)page{
    
    self->statusData =  [NSMutableArray array];
    self->homeTimeLineData = [[Home_TimeLine alloc]init];
   
    
    NSString *url = @"statuses/home_timeline.json";
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:[TokenTools getToken] forKey:@"access_token"];
    [params setValue: @(page) forKey:@"page"];
    
    
    [HttpRequest doGetWithURL:url withParams:params success:^(NSURLSessionDataTask * _Nonnull request, id  _Nonnull responseObject, Response * _Nonnull response) {
        
        self->homeTimeLineData =  [Home_TimeLine mj_objectWithKeyValues:responseObject];
        self->statusData = self->homeTimeLineData.statuses;
        
        
        [self.tableView reloadData];
        [self stopRefresh];
        
    } failure:^(NSURLSessionDataTask * _Nonnull request, NSError * _Nonnull error) {
        
        
        [self stopRefresh];
    }];
}


- (void)setUI{

    
    [self.view addSubview:self.tableView];

    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.right.mas_equalTo(self.view).mas_offset(-0);
        make.bottom.mas_equalTo(self.view).mas_offset(-0);
    }];
    //去掉cell分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    // 下拉刷新和上拉加载
    [self addRefreshHeader:self.tableView];
    [self addRefreshFooter:self.tableView];
    
}
- (void)getBaseDataMethod{
    self->currentPageNumber = 1;
    [self setDataWithPage:self->currentPageNumber];
}
-(void)getMoreDataMethod{
    self->currentPageNumber++;
    [self setDataWithPage:self->currentPageNumber];
    
}

#pragma mark - tableView
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return SCALE_Height(0.000000000001);
    }
    return SCALE_Height(10);
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self->statusData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
// 使cell高度自适应  此方法必须重写
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //这个值可以随意写
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    // 创建常量标识符
    NSString *identifier = self->statusData[indexPath.section].idstr;
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(! cell){
        cell = [[StatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    [cell setData:self->statusData[indexPath.section]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
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
