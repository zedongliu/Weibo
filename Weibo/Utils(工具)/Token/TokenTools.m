//
//  AccountTools.m
//  Weibo
//
//  Created by liuzedong on 2018/12/21.
//  Copyright © 2018 liuzedong. All rights reserved.
//

#import "TokenTools.h"

@implementation TokenTools


// 类方法一般用静态变量代替成员属性
static Account *_account;


// 存储token
+(void)saveToken:(NSString *)token
{
    [UserDefault setString:token forKey:kString_Token];
}

// 读取token
+(NSString *)getToken
{
    NSString *token = [UserDefault stringOfKey:kString_Token];
    return token;
}

// 清空token
+(void)cleanToken
{
    [UserDefault removeObjectForKey:kString_Token];
    
}

//通过code获取token
+ (void)getTokenWithCode:(NSString *)code success:(void (^)(void))success failure:(void (^)(NSError *))failure
{
    
    NSString *url = @"oauth2/access_token";
    NSString *client_id = @"3051454031";
    NSString *client_secret = @"a4ef53907c09c1b6f1daf5f8953d2581";
    NSString *grant_type = @"authorization_code";
    NSString *redirect_uri = @"http://www.baidu.com";
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    [params setValue:client_id forKey:@"client_id"];
    [params setValue:client_secret forKey:@"client_secret"];
    [params setValue:grant_type forKey:@"grant_type"];
    [params setValue:code forKey:@"code"];
    [params setValue:redirect_uri forKey:@"redirect_uri"];
    
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    [manager POST:[NSString stringWithFormat:@"%@%@",BASE_URL,url] parameters:params
          success:^(NSURLSessionDataTask * task, id responseObject) {
              
                NSLog(@"success--- %@", responseObject);
                Account *account = [Account mj_objectWithKeyValues:responseObject];
                //保存token
                [TokenTools saveToken:account.access_token];
              
                if (success) {
                    success();
                }
        
          }failure:^(NSURLSessionDataTask * task, NSError * error) {
              NSLog(@"token failure*** %@", error);
              if (failure) {
                  failure(error);
              }
          }
     ];
    
   
}


@end
