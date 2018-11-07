//
//  UserDefault.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefault : NSObject

/**
 获取缓存NSString
 
 @param aKey key
 @return key对应的NSString
 */
+ (NSString *)stringOfKey:(NSString *)aKey;
+ (void)setString:(NSString *)aString forKey:(NSString *)aKey;

/**
 获取缓存BOOL
 
 @param aKey key
 @return key对应的BOOL
 */
+ (BOOL)boolOfKey:(NSString *)aKey;
+ (void)setBool:(BOOL)aBool forKey:(NSString *)aKey;

/**
 获取缓存NSInteger
 
 @param aKey key
 @return key对应的NSInteger
 */
+ (NSInteger)integerOfKey:(NSString *)aKey;
+ (void)setInteger:(NSInteger)aInteger forKey:(NSString *)aKey;

/**
 获取缓存NSNumber
 
 @param aKey key
 @return key对应的NSNumber
 */
+ (NSNumber *)numberOfKey:(NSString *)aKey;
+ (void)setNumber:(NSNumber *)aNumber forKey:(NSString *)aKey;

/**
 获取缓存NSDictionary
 
 @param aKey key
 @return key对应的NSDictionary
 */
+ (NSDictionary *)dictionaryOfKey:(NSString *)aKey;
+ (void)setDictionary:(NSDictionary *)aDictionary forKey:(NSString *)aKey;

/**
 获取缓存NSMutableArray
 
 @param aKey key
 @return key对应的NSMutableArray
 */
+ (NSMutableArray *)arrayOfKey:(NSString *)aKey;
+ (void)setArray:(NSMutableArray *)aArray forKey:(NSString *)aKey;

/**
 获取缓存NSData
 
 @param aKey key
 @return key对应的NSData
 */
+ (NSData *)dataOfKey:(NSString *)aKey;
+ (void)setData:(NSData *)aData forKey:(NSString *)aKey;

/**
 获取缓存NSDictionary
 
 @param aPListFile key
 @return key对应的NSDictionary
 */
+ (NSDictionary *)dictionaryFromPListFile:(NSString *)aPListFile;

+ (void)synchronize;
+ (void)removeObjectForKey:(NSString *)aKey;


@end

NS_ASSUME_NONNULL_END
