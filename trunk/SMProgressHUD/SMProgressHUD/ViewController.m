//
//  ViewController.m
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/9.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import "ViewController.h"
#import "SMProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showLoading:(id)sender
{
    [[SMProgressHUD shareInstancetype] showLoadingWithTip:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
