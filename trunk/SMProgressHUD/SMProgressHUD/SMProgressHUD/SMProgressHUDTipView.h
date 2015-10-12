//
//  SMProgressHUDTipView.h
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/12.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ENUM(NSInteger, SMProgressHUDTipType)
{
    SMProgressHUDTipTypeSucceed = 0,
    SMProgressHUDTipTypeDone,
    SMProgressHUDTipTypeError,
    SMProgressHUDTipTypeWarning
};

@interface SMProgressHUDTipView : UIView

@end
