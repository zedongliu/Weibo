//
//  HttpRequest.h
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

//HTTP处理类
typedef void(^successBlock)(NSURLSessionDataTask *request,id responseObject,Response *response);
typedef void(^errorBlock)(NSURLSessionDataTask *request,NSError *error);

@interface HttpRequest : NSObject

+(AFHTTPSessionManager *)sharedHttpRequest;

//GET请求
+(void)doGetWithURL:(NSString *)url withParams:(NSDictionary *)params withType:(NSInteger)type success:(successBlock)done failure:(errorBlock)fail;

//POST请求
+(void)doPostWithURL:(NSString *)url withParams:(NSDictionary *)params withType:(NSInteger)type success:(successBlock)done failure:(errorBlock)fail;


@end

NS_ASSUME_NONNULL_END
