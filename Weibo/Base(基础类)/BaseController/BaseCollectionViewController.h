//
//  BaseCollectionViewController.h
//  Weibo
//
//  Created by liuzedong on 2018/11/6.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseCollectionViewController : BaseViewController<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *arrDataSource;

- (void)initData;
- (void)initUI;

@end

NS_ASSUME_NONNULL_END
