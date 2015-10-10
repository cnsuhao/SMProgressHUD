//
//  SMProgressHUD.h
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/9.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMProgressHUD : NSObject
+(instancetype)shareInstancetype;
- (void)showLoadingWithTip:(NSString *)tip;
@end
