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
+(void)doGetWithURL:(NSString *)url withParams:(NSDictionary *)params success:(successBlock)done failure:(errorBlock)fail;

//POST请求
+(void)doPostWithURL:(NSString *)url withParams:(NSDictionary *)params success:(successBlock)done failure:(errorBlock)fail;



///**
// *  发送get请求
// *
// *  @param URLString  请求的基本的url
// *  @param parameters 请求的参数字典
// *  @param success    请求成功的回调
// *  @param failure    请求失败的回调
// */
//+ (void)GET:(NSString *)URLString
// parameters:(id)parameters
//    success:(void (^)(id responseObject))success
//    failure:(void (^)(NSError *error))failure;
//
//
///**
// *  发送post请求
// *
// *  @param URLString  请求的基本的url
// *  @param parameters 请求的参数字典
// *  @param success    请求成功的回调
// *  @param failure    请求失败的回调
// */
//+ (void)Post:(NSString *)URLString
//  parameters:(id)parameters
//     success:(void (^)(id responseObject))success
//     failure:(void (^)(NSError *error))failure;
//
//
///**
// *  上传请求
// *
// *  @param URLString  请求的基本的url
// *  @param parameters 请求的参数字典
// *  @param success    请求成功的回调
// *  @param failure    请求失败的回调
// */
//+ (void)Upload:(NSString *)URLString
//    parameters:(id)parameters
//   uploadParam:(QWUploadParam *)uploadParam
//       success:(void (^)(id responseObject))success
//       failure:(void (^)(NSError *error))failure;


@end

NS_ASSUME_NONNULL_END
