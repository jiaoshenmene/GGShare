//
//  GGThirdPartyLoginHelprt.m
//  GGShareDemo
//
//  Created by dujia on 16/7/18.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "GGThirdPartyLoginHelprt.h"
#import "GGThirdPartyLoginVC.h"
#import "GGWeiboThirdPartLoginVC.h"

@implementation GGThirdPartyLoginHelprt

+ (void)loginByPlatform
{
    GGWeiboThirdPartLoginVC *vc = [[GGWeiboThirdPartLoginVC alloc] init];
 
    UIApplication *app = [UIApplication sharedApplication];
    [app.keyWindow.rootViewController presentViewController:vc animated:YES completion:^{
        
    }];
}

@end
