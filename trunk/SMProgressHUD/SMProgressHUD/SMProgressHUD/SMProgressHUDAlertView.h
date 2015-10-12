//
//  SMProgressHUDAlertView.h
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/12.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMProgressHUDAlertView;

typedef void (^AlertViewCompletion)(SMProgressHUDAlertView *alertView, NSInteger buttonIndex);

typedef NS_ENUM(NSInteger,SMProgressHUDAlertViewStyle)
{
    SMProgressHUDAlertViewStyleDefault = 0,
    SMProgressHUDAlertViewStyleSecureTextInput,
    SMProgressHUDAlertViewStylePlainTextInput,
    SMProgressHUDAlertViewStyleLoginAndPasswordInput
};


@interface SMProgressHUDAlertView : UIView
@property (nonatomic, strong, readonly) UITextField *plainTextInput;
@property (nonatomic, strong, readonly) UITextField *secureTextInput;
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message alertViewStyle:(SMProgressHUDAlertViewStyle)alertStyle cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles completion:(AlertViewCompletion)completion;
@end
