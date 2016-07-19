//
//  GGThirdPartHTTPClient.h
//  GGShareDemo
//
//  Created by dujia on 16/7/19.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface GGThirdPartHTTPClient : AFHTTPSessionManager
+ (instancetype)sharedClient;


@end
