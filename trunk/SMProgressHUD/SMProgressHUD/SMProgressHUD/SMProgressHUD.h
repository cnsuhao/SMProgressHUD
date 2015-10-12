//
//  SMProgressHUD.h
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/9.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMProgressHUDAlertView.h"

@interface SMProgressHUD : NSObject
+(instancetype)shareInstancetype;
- (void)showLoadingWithTip:(NSString *)tip;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message alertStyle:(SMProgressHUDAlertViewStyle)alertStyle cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles completion:(void (^)(SMProgressHUDAlertView *alertView, NSInteger buttonIndex))completion;
- (void)dismiss;
@end
