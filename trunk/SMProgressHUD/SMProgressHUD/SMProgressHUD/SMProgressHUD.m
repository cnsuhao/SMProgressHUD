//
//  SMProgressHUD.m
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/9.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMProgressHUD.h"

static SMProgressHUD *_indicatorInstance;

@interface SMProgressHUD()
@property (strong, nonatomic) UIWindow *window;
@end

@implementation SMProgressHUD
+(instancetype)shareInstancetype
{
    if (nil == _indicatorInstance) {
        _indicatorInstance = [[super allocWithZone:NULL] init];
    }
    return  _indicatorInstance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _indicatorInstance = [super allocWithZone:zone];
    });
    return _indicatorInstance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window setBackgroundColor:[UIColor clearColor]];
        [_window setWindowLevel:UIWindowLevelAlert];
        [_window makeKeyAndVisible];
        [_window setHidden:YES];
        
        
    }
    return self;
}
@end
