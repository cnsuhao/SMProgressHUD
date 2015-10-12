//
//  SMProgressHUDTipView.m
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/12.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import "SMProgressHUDTipView.h"
#import "SMProgressHUDConfigure.h"
#import "SMProgressHUD.h"

@interface SMProgressHUDTipView()
@property (strong, nonatomic)UILabel *tip;
@property (strong, nonatomic) UIImageView *icon;
@end

@implementation SMProgressHUDTipView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self.layer setCornerRadius:kSMProgressHUDCornerRadius];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setShadowOffset:CGSizeMake(0, 2)];
        [self.layer setShadowOpacity:0.2];
        
        UIImage *image= [UIImage imageNamed:@"progresshud.bundle/succeed"];
        UIImageView *icon = [[UIImageView alloc] initWithImage:image];
        [icon setFrame:CGRectMake(0, 0, 30, 30)];
        [icon setCenter:CGPointMake(kSMProgressHUDContentWidth/2, 25)];
        [self addSubview:icon];
        _icon = icon;
    }
    return self;
}
@end
