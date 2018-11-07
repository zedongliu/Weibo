//
//  NSString+Util.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

+ (BOOL)judgeIsNone:(NSString *)paraStr{
    if ([paraStr isMemberOfClass:[NSNull class]] || paraStr.length <= 0 || [paraStr isEqualToString:@""] || [paraStr isEqualToString:@" "]) {
        return true;
    }else{
        return false;
    }
}
//过滤过的手机号 过滤 “-” “ ” “+86”
- (NSString *)strTelFilter
{
    NSString *tempString = self.copy;
    tempString = [tempString stringByReplacingOccurrencesOfString:@"+86"
                                                       withString:@""];
    NSCharacterSet *setToRemove = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]invertedSet];
    NSArray *arrStr = [tempString componentsSeparatedByCharactersInSet:setToRemove];
    NSString *strPhone = [arrStr componentsJoinedByString:@""];
    return strPhone;
}
+ (NSString *)removeNSRegularExpression:(NSString *)keyString{
    NSString *content = keyString;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]" options:0 error:nil];
    content = [regularExpression stringByReplacingMatchesInString:content options:0 range:NSMakeRange(0, content.length) withTemplate:@" "];
    return content;
}
@end
