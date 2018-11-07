//
//  Response.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Response : BaseModel

/** code */
@property (nonatomic, assign) NSInteger code;
/** msg */
@property (nonatomic, strong) NSString *msg;

@end

NS_ASSUME_NONNULL_END
