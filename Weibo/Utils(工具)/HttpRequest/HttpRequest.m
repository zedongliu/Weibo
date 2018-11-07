//
//  HttpRequest.m
//  Weibo
//
//  Created by liuzedong on 2018/11/7.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "HttpRequest.h"
#import "BaseNavigationController.h"
#import "UserDefault.h"

#define k_HttpRequest_Timeout 30

@implementation HttpRequest

//得到HttpRequset单例
+(AFHTTPSessionManager *)sharedHttpRequest{
    static dispatch_once_t predicate;
    static AFHTTPSessionManager *sharedHttpRequestInstance = nil;
    dispatch_once(&predicate, ^{
        sharedHttpRequestInstance = [[AFHTTPSessionManager manager] init]; sharedHttpRequestInstance.securityPolicy.allowInvalidCertificates = YES;
        
        AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        
        sharedHttpRequestInstance.requestSerializer = [AFJSONRequestSerializer serializer];
        
        NSURLCache *urlCache = [[NSURLCache alloc]initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:24 * 1024 * 1024 diskPath:nil];
        [NSURLCache setSharedURLCache:urlCache];
        
        AFSecurityPolicy *security = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [security setValidatesDomainName:NO];
        security.allowInvalidCertificates = YES;
        sharedHttpRequestInstance.securityPolicy = security;
        
    });
    return sharedHttpRequestInstance;
}

//get
+(void)doGetWithURL:(NSString *)url withParams:(NSDictionary *)params withType:(NSInteger)type success:(successBlock)done failure:(errorBlock)fail
{
    AFHTTPSessionManager *manage = [HttpRequest sharedHttpRequest];
    NSString *formedUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    manage.requestSerializer.stringEncoding = NSUTF8StringEncoding;
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/plain",@"image/jpeg",@"image/png",nil];
    
    manage.requestSerializer.timeoutInterval = k_HttpRequest_Timeout;
    
    if (type != REQ_TYPE_LOGIN) {
        AFJSONRequestSerializer *serial = [AFJSONRequestSerializer serializer];
        [serial setValue:[UserDefault stringOfKey:kStringUserId] forHTTPHeaderField:@"userId"];
        manage.requestSerializer = serial;
    }
    
//    BOOL ceshiEve = [UserDefault boolOfKey:kBOOLIsCeshiEve];
    NSString *baseUrl = BASE_URL;
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",baseUrl,formedUrl];
    NSLog(@"doGetWithURL:%@",requestUrl);
    
    [manage GET:requestUrl
     parameters:params
       progress:^(NSProgress * _Nonnull downloadProgress) {
           
       } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         [SVProgressHUD dismiss];
         ///数据是否正确
         if (![responseObject isKindOfClass:[NSDictionary class]])
         {
             responseObject = [responseObject mj_JSONObject];
         }
         
         if (DEBUG) {
             NSLog(@"GET:%@",task.currentRequest.URL);
             NSLog(@"Response:%@",responseObject);
         }
         
         Response *result = [Response mj_objectWithKeyValues:responseObject];
//         if(result.code==ResponseCode400 ||result.code==ResponseCode401){
//
//             if(result.code==ResponseCode401){
//
//                 [SVProgressHUD showErrorWithStatus:@"您的账号在别处登录！"];
//                 [SVProgressHUD dismissWithDelay:1.5];
//             }
//             //跳转登录页面
//             BaseNavigationController *loginVC = [[BaseNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
//             UIWindow *window= [UIApplication sharedApplication].keyWindow;
//             window.rootViewController = loginVC;
//             [window makeKeyAndVisible];
//         }else{
             done(task,responseObject,result);
//         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         if (DEBUG) {
             NSLog(@"ERROR:%@",error);
         }
         
         [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [SVProgressHUD dismiss];
         });
         fail(task,error);
         
     }];
}


//post
+(void)doPostWithURL:(NSString *)url withParams:(NSDictionary *)params withType:(NSInteger)type success:(successBlock)done failure:(errorBlock)fail
{
    AFHTTPSessionManager *manage = [HttpRequest sharedHttpRequest];
    
    NSString *formedUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"image/jpeg",@"image/png",@"application/octet-stream",@"text/json",@"text/plain",@"text/javascript",nil];
    manage.requestSerializer.timeoutInterval = k_HttpRequest_Timeout;
    
//    BOOL ceshiEve = [UserDefault boolOfKey:kBOOLIsCeshiEve];
    NSString *baseUrl = BASE_URL;
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",baseUrl,formedUrl];
    NSLog(@"doGetWithURL:%@",requestUrl);
    NSLog(@"doPostWithURL:%@ param:%@",requestUrl,params);
    
    [manage POST:requestUrl
      parameters:params
        progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         [SVProgressHUD dismiss];
         ///数据是否正确
         if (![responseObject isKindOfClass:[NSDictionary class]])
         {
             responseObject = [responseObject mj_JSONObject];
         }
         
         if (DEBUG) {
             NSLog(@"POST:%@ \n Params:%@",task.currentRequest.URL,params);
             NSLog(@"Response:%@",responseObject);
         }
         Response *result = [Response mj_objectWithKeyValues:responseObject];
//         if(result.code==ResponseCode400 ||
//            result.code==ResponseCode401){
//
//             if(result.code==ResponseCode401){
//
//                 [SVProgressHUD showErrorWithStatus:@"您的账号在别处登录！"];
//                 [SVProgressHUD dismissWithDelay:1.5];
//             }
//             //跳转登录页面
//             BaseNavigationController *loginVC = [[BaseNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
//             UIWindow *window= [UIApplication sharedApplication].keyWindow;
//             window.rootViewController = loginVC;
//             [window makeKeyAndVisible];
//         }else{
             done(task,responseObject,result);
//         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
         if (DEBUG) {
             NSLog(@"ERROR:%@",error);
         }
         [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [SVProgressHUD dismiss];
         });
         
         fail(task,error);
     }];
}


@end
