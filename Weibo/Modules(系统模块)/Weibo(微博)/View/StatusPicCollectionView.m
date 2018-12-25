//
//  StatusPicCollectionView.m
//  Weibo
//
//  Created by liuzedong on 2018/12/25.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "StatusPicCollectionView.h"

#define cellID @"cellID"

@interface StatusPicCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, assign) CGSize ItemSize;
@property (nonatomic, strong) NSArray *ImageArray;

@end

@implementation StatusPicCollectionView

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = self.ItemSize;
        _layout.minimumLineSpacing = 10.0;
        _layout.minimumInteritemSpacing = 0.0;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return _layout;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewItemSize:(CGSize)itemSize withImageArr:(NSArray *)imagerArr {
    _ItemSize = itemSize;
    if (self = [super initWithFrame:frame collectionViewLayout:self.layout]) {
        //        [self setLayout:self.layout];
        _ImageArray = imagerArr;
        self.bounces = NO;
        self.pagingEnabled = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.ImageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)]; //
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:_ImageArray[indexPath.row]];
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
