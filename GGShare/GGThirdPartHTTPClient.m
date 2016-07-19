//
//  GGThirdPartHTTPClient.m
//  GGShareDemo
//
//  Created by dujia on 16/7/19.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGThirdPartHTTPClient.h"

@implementation GGThirdPartHTTPClient
+ (instancetype)sharedClient {
    static GGThirdPartHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [GGThirdPartHTTPClient manager];
        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        _sharedClient.requestSerializer.timeoutInterval = 5.0f;
//        [_sharedClient.requestSerializer setValue:[self ] forHTTPHeaderField:@""];
        //@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain"
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", nil];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    });
    
    return _sharedClient;
}
@end
