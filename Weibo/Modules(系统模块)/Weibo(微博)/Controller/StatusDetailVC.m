//
//  StatusDetailVC.m
//  Weibo
//
//  Created by Zedong on 2019/1/3.
//  Copyright © 2019年 liuzedong. All rights reserved.
//

#import "StatusDetailVC.h"
#import "StatusContentCell.h"
#import "Comments_Show.h"
#import "CommentModel.h"
#import "StatusCell.h"
#import "CommentCell.h"

@interface StatusDetailVC (){
    Comments_Show  *commentsDataShow;
    NSMutableArray <CommentModel*> *commentsData;
    NSInteger currentPageNumber;
}

@end

@implementation StatusDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->currentPageNumber = 1;
    
    [self setDataWithPage:self->currentPageNumber];
    [self setUI];
}

- (void)setDataWithPage:(NSInteger)page{
    NSString *url = @"comments/show.json";
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:[TokenTools getToken] forKey:@"access_token"];
    [params setValue:@(self.statusData.id) forKey:@"id"];
    [params setValue: @(page) forKey:@"page"];
    
    [HttpRequest doGetWithURL:url withParams:params success:^(NSURLSessionDataTask * _Nonnull request, id  _Nonnull responseObject, Response * _Nonnull response) {
        
        self->commentsDataShow =  [Comments_Show mj_objectWithKeyValues:responseObject];
        self->commentsData = self->commentsDataShow.comments;
        [self.tableView reloadData];
        [self stopRefresh];
        
    } failure:^(NSURLSessionDataTask * _Nonnull request, NSError * _Nonnull error) {
        [self stopRefresh];
    }];
}

-(void)setUI{
    [self setTitle:@"微博正文"];
    [self initNaviLeftButton:0];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(0);
        make.right.mas_equalTo(self.view).mas_offset(-0);
        make.bottom.mas_equalTo(self.view).mas_offset(-0);
    }];
    //去掉cell分割线
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 下拉刷新和上拉加载
//    [self addRefreshHeader:self.tableView];
    [self addRefreshFooter:self.tableView];
    
}
//- (void)getBaseDataMethod{
//    self->currentPageNumber = 1;
//    [self setDataWithPage:self->currentPageNumber];
//}
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
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRow = 0;
    switch (section) {
        case 0:
            numberOfRow = 1;
            break;
        case 1:
            numberOfRow = self->commentsData.count;
            break;
        default:
            break;
    }
    return numberOfRow;
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
    
    if(indexPath.section == 0){
    
        // 创建常量标识符
        NSString *identifier = self.statusData.idstr;
        StatusContentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(! cell){
            cell = [[StatusContentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        [cell setStatusData:self.statusData];
        return cell;
    }else{
        // 创建常量标识符
        NSString *identifier = self->commentsData[indexPath.row].idstr;
        CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if(! cell){
            cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        }
        [cell setCommentData:self->commentsData[indexPath.row]];
        return cell;
    }
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
