//
//  Account.h
//  Weibo
//
//  Created by liuzedong on 2018/12/19.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 "access_token" = "2.00rgrSmFbkehbC7e6d1c76a9ZumKNB";
 "expires_in" = 157679999;
 "remind_in" = 157679999;
 uid = 5294424581;
 
 参考http://open.weibo.com/wiki/OAuth2/access_token
 
 */

@interface Account : NSObject<NSCoding>

/**
*  获取数据的访问命令牌
*/
@property (nonatomic, copy) NSString *access_token;
/**
 *  账号的有效期
 */
@property (nonatomic, copy) NSString *expires_in;
/**
 *  用户唯一标识符
 */
@property (nonatomic, copy) NSString *uid;

/**
 *   过期时间 = 当前保存时间+有效期
 */
@property (nonatomic, strong) NSDate *expires_date;

/**
 *  账号的有效期
 */
@property (nonatomic, copy) NSString *remind_in;

/**
 *  用户的昵称
 */
@property (nonatomic, copy) NSString *name;


+ (instancetype)accountWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
