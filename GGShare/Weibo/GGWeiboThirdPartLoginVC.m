//
//  GGWeiboThirdPartLoginVC.m
//  GGShareDemo
//
//  Created by dujia on 16/7/19.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGWeiboThirdPartLoginVC.h"
#import "GGThirdPartHTTPClient.h"
#import <AFNetworking.h>



@interface GGWeiboThirdPartLoginVC()

@property (nonatomic , strong) NSString *mcode;

@end

@implementation GGWeiboThirdPartLoginVC

- (NSDictionary*)dictionaryFromQuery:(NSString*)query usingEncoding:(NSStringEncoding)encoding {
    NSRange range = [query rangeOfString:@"?"];
    NSString *newString = [query substringWithRange:NSMakeRange(range.location + 1, query.length - range.location - 1)];
    NSLog(@"%@",newString);
    
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:newString];
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
//            NSString* key = [[kvPair objectAtIndex:0]
//                             stringByReplacingPercentEscapesUsingEncoding:encoding];
            
            NSString *key = [[kvPair objectAtIndex:0] stringByRemovingPercentEncoding];
            NSString* value = [[kvPair objectAtIndex:1]
                               stringByRemovingPercentEncoding];
            [pairs setObject:value forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:pairs];
}



- (void) viewDidLoad
{
    [super viewDidLoad];
    _mcode = @"";
//    NSDictionary *dic = [self dictionaryFromQuery:@"https://m.baidu.com/?code=3ca457580ad249880e984afce5e0ce3c&from=844b&vit=fps" usingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@",dic);
    
    [self requestUrl:@"https://api.weibo.com/oauth2/authorize?client_id=3145625561&redirect_uri=http://www.baidu.com&display=mobile" delegate:self];
    
    
//    NSDictionary *params = @{@"client_id":@"3145625561",
//                             @"client_secret":@"0a61cc8a017fa8ba6c98532fefa3c29c",
//                             @"grant_type":@"authorization_code",
//                             @"code":@"fb78e45dadff201f06d95ef8f3d0b4a1",
//                             @"redirect_uri":@"http://www.baidu.com"};
//    
//    [self requestPost:@"https://api.weibo.com/oauth2/access_token" params:params];
//    [self getweiboShow:nil];
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%ld",(long)navigationType);
    
    
    if (navigationType == UIWebViewNavigationTypeFormSubmitted) {
        NSURL* resultStr = [request URL];
        NSString* tempStr = [resultStr absoluteString];
        if ([tempStr rangeOfString:@"code"].length != 0) {
            NSLog(@"%@",tempStr);
            NSDictionary *dic = [self dictionaryFromQuery:tempStr usingEncoding:NSUTF8StringEncoding];
            NSLog(@"%@",dic);
            NSString *code = [dic objectForKey:@"code"];
            NSLog(@"code = %@",code);
            _mcode = code;
            if (_mcode.length > 0) {
                NSDictionary *params = @{@"client_id":@"3145625561",
                                         @"client_secret":@"0a61cc8a017fa8ba6c98532fefa3c29c",
                                         @"grant_type":@"authorization_code",
                                         @"code":code,
                                         @"redirect_uri":@"http://www.baidu.com"};
                
                [self requestPost:@"https://api.weibo.com/oauth2/access_token" params:params];
            }
        }
        
        
    }
    return YES;
}

- (void)requestPost:(NSString *)url params:(NSDictionary *)params
{

    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    
    [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
      
        
        
        NSLog(@"请求成功1243---%@", responseObject);
        [self getweiboShow:[responseObject objectForKey:@"access_token"]uid:[responseObject objectForKey:@"uid"]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"请求失败12---%@", error);
    }];
    
}

- (void)getweiboShow:(NSString *)access_token  uid:(NSString *)uid
{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:@{@"access_token":access_token,@"uid":uid} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功1243---%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败12---%@", error);
    }];
    
    
}



@end
