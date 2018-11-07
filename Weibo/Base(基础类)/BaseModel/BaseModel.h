//
//  BaseModel.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

///模型原始数据，需要主动赋值
@property (nonatomic, copy) NSDictionary *dicData;
///上传数据 重载
- (NSMutableDictionary *)dicDataForUpLoad;
///初始化数据 重载
- (void)initData;

@end

NS_ASSUME_NONNULL_END
