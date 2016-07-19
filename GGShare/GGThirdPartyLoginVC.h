//
//  GGThirdPartyLoginVC.h
//  GGShareDemo
//
//  Created by dujia on 16/7/18.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GGThirdPartyLoginVC : UIViewController<UIWebViewDelegate>

- (void)requestUrl:(NSString *)urlstring delegate:(id)delegate;

@end
