//
//  ViewController.m
//  GGShareDemo
//
//  Created by dujia on 16/7/18.
//  Copyright © 2016年 dujia. All rights reserved.
//

#import "ViewController.h"
#import "GGThirdPartyLoginVC.h"
#import "GGThirdPartyLoginHelprt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *toolView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    toolView.userInteractionEnabled = YES;
//    toolView.tag = i;
//    toolView.image = [UIImage imageNamed:self.tools[i]];
    toolView.backgroundColor = [UIColor redColor];
    [toolView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)]];
    [self.view addSubview:toolView];
}

- (void)click:(UIGestureRecognizer *)gesture
{

    [GGThirdPartyLoginHelprt loginByPlatform];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
