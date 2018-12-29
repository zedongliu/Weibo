//
//  CommentController.m
//  Weibo
//
//  Created by Zedong on 2018/12/29.
//  Copyright © 2018年 liuzedong. All rights reserved.
//

#import "CommentController.h"
#import "CommentCell.h"
#import "Comments_ToMe.h"

@interface CommentController (){
    Comments_ToMe  *commentsToMeData;
    NSInteger currentPageNumber;
    NSMutableArray <StatusModel*> *commentData;
}

@end

@implementation CommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self->currentPageNumber = 1;
    
    [self setDataWithPage:self->currentPageNumber];
    [self setUI];
}

- (void)setDataWithPage:(NSInteger)page{
    
    self->commentData =  [NSMutableArray array];
    self->commentsToMeData = [[Comments_ToMe alloc]init];
    
    
    NSString *url = @"comments/to_me.json";
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:[TokenTools getToken] forKey:@"access_token"];
    [params setValue: @(page) forKey:@"page"];
    
    
    [HttpRequest doGetWithURL:url withParams:params success:^(NSURLSessionDataTask * _Nonnull request, id  _Nonnull responseObject, Response * _Nonnull response) {
        
        self->commentsToMeData =  [Comments_ToMe mj_objectWithKeyValues:responseObject];
        self->commentData = self->commentsToMeData.comments;
        
        
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
    return self->commentData.count;
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
    NSString *identifier = self->commentData[indexPath.section].idstr;
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(! cell){
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    [cell setCommentData:self->commentData[indexPath.section]];
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
