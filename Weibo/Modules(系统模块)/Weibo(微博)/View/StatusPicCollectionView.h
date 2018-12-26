//
//  StatusPicCollectionView.h
//  Weibo
//
//  Created by liuzedong on 2018/12/25.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface StatusPicCollectionView : BaseCollectionView

/**
 *  @frame: 外界传来的frame 即collectionView的大小
 *
 *  @itemSize: 即collectionViewCell上的Item大小
 *
 *  @imagerArr: 外界存放UIImage的数组
 */
- (instancetype)initWithFrame:(CGRect)frame itemSize:(CGSize)itemSize withImageArr:(NSArray *)imagerArr withIdentifier:(NSString*)Identifier;



@end

NS_ASSUME_NONNULL_END
