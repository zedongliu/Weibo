//
//  StatusModel.m
//  Weibo
//
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "StatusModel.h"

@implementation User
@end

@implementation Pic_Url
@end

@implementation RetweetedStatus
@end

@implementation StatusModel

+ (NSDictionary *)objectClassInArray{
    return @{
             @"pic_urls" : @"Pic_Url"
             };
}

@end
