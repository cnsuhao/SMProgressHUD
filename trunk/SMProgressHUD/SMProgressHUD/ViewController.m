//
//  ViewController.m
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/9.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import "ViewController.h"
#import "SMProgressHUD.h"

@interface ViewController ()<SMProgressHUDAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showLoading:(id)sender
{
    [[SMProgressHUD shareInstancetype] showLoadingWithTip:nil];
}
- (IBAction)showAlertView:(id)sender {
    [[SMProgressHUD shareInstancetype] showAlertWithTitle:@"Title" message:@"The difference in winning and losing is most often…not quitting." delegate:nil alertStyle:SMProgressHUDAlertViewStyleDefault cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confrim",@"Go"] ];
}

- (IBAction)showAlertViewWithInput:(id)sender {
    [[SMProgressHUD shareInstancetype] showAlertWithTitle:@"Title" message:@"The difference in winning and losing is most often…not quitting." delegate:nil alertStyle:SMProgressHUDAlertViewStylePlainTextInput cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confrim",@"Go"] ];
}

- (void)alertView:(SMProgressHUDAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Click The Button At %ld", (long)buttonIndex);
    [self showLoadingWithTip:nil];
}

- (IBAction)showTip:(id)sender {
    [[SMProgressHUD shareInstancetype] showTip:@"The difference in winning and losing is most often…not quitting."];
}
- (IBAction)showLoadingWithTip:(id)sender {
    [[SMProgressHUD shareInstancetype] showLoadingWithTip:nil];
    [self performSelector:@selector(showTip:) withObject:nil afterDelay:5];
}

- (IBAction)showAlertLoadingTip:(id)sender {
    [[SMProgressHUD shareInstancetype] showAlertWithTitle:@"Title" message:@"The difference in winning and losing is most often…not quitting." delegate:self alertStyle:SMProgressHUDAlertViewStyleDefault cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confrim",@"Go"] ];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
