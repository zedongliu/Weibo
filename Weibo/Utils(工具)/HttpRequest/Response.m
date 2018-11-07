//
//  Response.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "Response.h"

@implementation Response

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"code":@"statusCode"
             };
}

@end
