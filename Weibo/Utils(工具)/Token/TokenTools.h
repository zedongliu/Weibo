//
//  AccountTools.h
//  Weibo
//
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface TokenTools : NSObject



+ (void)getTokenWithCode:(NSString *)code success:(void(^)(void))success failure:(void(^)(NSError *error))failure;

// 存储token
+(void)saveToken:(NSString *)token;

// 读取token
+(NSString *)getToken;

// 清空token
+(void)cleanToken;

@end

NS_ASSUME_NONNULL_END
