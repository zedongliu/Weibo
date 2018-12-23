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

@interface WeiboRootVC (){
    Home_TimeLine  *homeTimeLineData;
    NSMutableArray <StatusModel*> *statusData;
}
@property(nonatomic,strong)UILabel *text_Lab;

@end

@implementation WeiboRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData];
    [self setUI];
}

- (void)setData{
    
    self->statusData =  [NSMutableArray array];
    
    NSString *url = @"statuses/home_timeline.json";
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:[TokenTools getToken] forKey:@"access_token"];
    
    
    [HttpRequest doGetWithURL:url withParams:params success:^(NSURLSessionDataTask * _Nonnull request, id  _Nonnull responseObject, Response * _Nonnull response) {
        
        self->homeTimeLineData =  [Home_TimeLine mj_objectWithKeyValues:responseObject];
        self->statusData = self->homeTimeLineData.statuses;
        
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"微博数量：%lu",(unsigned long)self->statusData.count]];
        NSLog(@"微博数据：%@",self->statusData[0].text);
        
    } failure:^(NSURLSessionDataTask * _Nonnull request, NSError * _Nonnull error) {

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
    [self.tableView registerClass:[StatusCell class] forCellReuseIdentifier:@"statusCell"];
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - tableView
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return statusData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCALE_Heigth(60);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"statusCell" forIndexPath:indexPath];
    cell.statusData = statusData[indexPath.row];
    cell.text_Lab.text = statusData[indexPath.row].text;
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
