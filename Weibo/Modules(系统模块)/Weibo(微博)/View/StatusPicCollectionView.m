//
//  StatusPicCollectionView.m
//  Weibo
//
//  Created by liuzedong on 2018/12/25.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "StatusPicCollectionView.h"
#import "StatusModel.h"

#define cellID @"cellID"

@interface StatusPicCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize ItemSize;
@property (nonatomic, strong) NSArray<Pic_Url*> *ImageArray;
@property (nonatomic, strong) NSString *Identifier;

@end

@implementation StatusPicCollectionView

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = self.ItemSize;
        _layout.minimumLineSpacing = 3.0;
        _layout.minimumInteritemSpacing = 3.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _layout;
}
- (instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize)itemSize withImageArr:(NSArray *)imagerArr withIdentifier:(NSString*)Identifier{
    _ItemSize = itemSize;
    _Identifier = Identifier;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
        //        [self setLayout:self.layout];
        [self setBackgroundColor:COLOR_WHITE];
        _ImageArray = imagerArr;
        self.bounces = NO;
        self.pagingEnabled = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:Identifier];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.ImageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.Identifier forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)]; //
    
    UIImageView *imageV = [[UIImageView alloc]init];
    [imageV sd_setImageWithURL:[NSURL URLWithString:_ImageArray[indexPath.row].thumbnail_pic]];
    CGRect imageFrame = imageV.frame;
    imageFrame.size = _ItemSize;
    imageV.frame = imageFrame;
    [cell.contentView addSubview:imageV];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"第%ld分区--第%ld个Item", indexPath.section, indexPath.row);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
