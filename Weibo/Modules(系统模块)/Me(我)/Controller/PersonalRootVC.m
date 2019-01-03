//
//  PersonalRootVC.m
//  Weibo
//
//  Created by liuzedong on 2018/12/19.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "PersonalRootVC.h"
#import "UserInfoCell.h"
#import "UserModel.h"

@interface PersonalRootVC ()<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
{
    UserModel *userData;
}

@end

@implementation PersonalRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData];
    [self setUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //返回时隐藏导航栏
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
}

#pragma mark - UI
- (void)setUI{
    
    // 设置导航控制器的代理为self
//    self.navigationController.delegate = self;
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    //初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView setBackgroundColor:COLOR_F2F2F2];
    //注册collectionViewCell
    [self.collectionView registerClass:[UserInfoCell class] forCellWithReuseIdentifier:@"userInfoCell"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //消除顶部空白
    if (@available(iOS 11.0, *)) {
        
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
    }
    
    //点击显示高亮
    self.collectionView.delaysContentTouches = false;
}

#pragma mark - Data
-(void)setData{
    
    NSString *url = @"2/users/show.json";
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:[TokenTools getToken] forKey:@"access_token"];
    [params setValue:[UserDefault stringOfKey:@"uid"] forKey:@"uid"];


    [HttpRequest doGetWithURL:url withParams:params success:^(NSURLSessionDataTask * _Nonnull request, id  _Nonnull responseObject, Response * _Nonnull response) {

        self->userData =  [UserModel mj_objectWithKeyValues:responseObject];


    } failure:^(NSURLSessionDataTask * _Nonnull request, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - Delegate

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger num = 0;
    switch (section) {
        case 0:
            num = 1;
            break;
        case 1:
            num = 1;
            break;
        case 2:
            num = 1;
            break;
        case 3:
            num = 1;
            break;
        default:
            num = 1;
            break;
    }
    return num;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        UserInfoCell *cell = (UserInfoCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"userInfoCell" forIndexPath:indexPath];
        
        [cell setUserInfoData:self->userData];
        
        return cell;
    }else{
        UICollectionViewCell *cell = (UICollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        
        return cell;
    }
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //cell个数
    NSInteger num = 4;
//    CGFloat width = CGRectGetWidth(collectionView.bounds)/num;
//    CGFloat height = 90;
    
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(KScreenWidth, 148);
            break;
        case 1:
            return CGSizeMake(KScreenWidth, 60);
            break;
        case 2:
            return CGSizeMake(KScreenWidth, 60);
            break;
        case 3:
            return CGSizeMake(KScreenWidth, 60);
            break;
        default:
            return CGSizeMake(KScreenWidth, KScreenHeight);
            break;
    }
    
}

//footer的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(KScreenWidth, 12);
}

//header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//点击显示高亮色
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = COLOR_ECECEC;
}
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = COLOR_WHITE;
}
//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Sheet
- (void)presentActionSheet:(NSArray *)arrTitles
{
   
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [self postImage:image];
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - Request
- (void)postImage:(UIImage*)image{
    
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
