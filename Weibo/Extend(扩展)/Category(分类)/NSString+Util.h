//
//  NSString+Util.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Util)

/**
 判断是否为空字符串
 
 @param paraStr 判断的字符串
 @return bool
 */
+ (BOOL)judgeIsNone:(NSString *)paraStr;
//过滤过的手机号 过滤 “-” “ ” “+86”
- (NSString *)strTelFilter;

+ (NSString *)removeNSRegularExpression:(NSString *)keyString;
@end

NS_ASSUME_NONNULL_END
