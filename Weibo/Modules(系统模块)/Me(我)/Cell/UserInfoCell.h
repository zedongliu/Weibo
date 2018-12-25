//
//  UserInfoCell.h
//  Weibo
//
//  Created by liuzedong on 2018/12/23.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseCollectionViewCell.h"
#import "UserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoCell : BaseCollectionViewCell


-(void)setUserInfoData:(UserModel*)userInfoData;

@end

NS_ASSUME_NONNULL_END
