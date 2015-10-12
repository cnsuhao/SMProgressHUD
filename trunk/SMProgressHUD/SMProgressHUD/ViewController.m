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
- (IBAction)showAlertView:(id)sender {
    [[SMProgressHUD shareInstancetype] showAlertWithTitle:@"Title" message:@"The difference in winning and losing is most often…not quitting." alertStyle:SMProgressHUDAlertViewStyleDefault cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confrim",@"Go"] completion:^(SMProgressHUDAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"Click The Button At %ld", (long)buttonIndex);
    }];
}

- (IBAction)showAlertViewWithInput:(id)sender {
    [[SMProgressHUD shareInstancetype] showAlertWithTitle:@"Title" message:@"The difference in winning and losing is most often…not quitting." alertStyle:SMProgressHUDAlertViewStylePlainTextInput cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confrim",@"Go"] completion:^(SMProgressHUDAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"Click The Button At %ld", (long)buttonIndex);

    }];
}

- (IBAction)showTip:(id)sender {
    [[SMProgressHUD shareInstancetype] showTip:@"The difference in winning and losing is most often…not quitting."];
}
- (IBAction)showLoadingWithTip:(id)sender {
    [[SMProgressHUD shareInstancetype] showLoadingWithTip:nil];
    [self performSelector:@selector(showTip:) withObject:nil afterDelay:5];
}

- (IBAction)showAlertLoadingTip:(id)sender {
//    [[SMProgressHUD shareInstancetype] showAlertWithTitle:@"Title" message:@"The difference in winning and losing is most often…not quitting." alertStyle:SMProgressHUDAlertViewStyleDefault cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Confrim",@"Go"] completion:^(SMProgressHUDAlertView *alertView, NSInteger buttonIndex)
//    {
//        NSLog(@"Click The Button At %ld", (long)buttonIndex);
//        self.view setBackgroundColor:[UIColor re]
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
