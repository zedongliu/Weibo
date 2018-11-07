//
//  BaseModel.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (id)copyWithZone:(NSZone *)zone
{
    BaseModel *model = [[self class]allocWithZone:zone];
    return model;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    BaseModel *model = [[self class]allocWithZone:zone];
    return model;
}

- (NSMutableDictionary *)dicDataForUpLoad
{
    return [NSMutableDictionary dictionary];
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self initData];
    }
    return self;
}

- (void)initData{};

@end
