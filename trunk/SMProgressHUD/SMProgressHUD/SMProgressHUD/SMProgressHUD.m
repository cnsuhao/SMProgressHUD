//
//  SMProgressHUD.m
//  SMProgressHUD
//
//  Created by OrangeLife on 15/10/9.
//  Copyright (c) 2015年 Shenme Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMProgressHUD.h"
#import "SMProgressHUDLoadingView.h"
#import "SMProgressHUDConfigure.h"

static SMProgressHUD *_indicatorInstance;

typedef enum : NSUInteger {
    SMProgressHUDStateStatic,
    SMProgressHUDStateLoading,
    SMProgressHUDStateAlert,
} SMProgressHUDState;

@interface SMProgressHUD()
@property (assign, nonatomic) NSInteger loadingCount;
@property (assign, nonatomic) SMProgressHUDState state;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SMProgressHUDLoadingView *loadingView;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UIView *maskLayer;
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
        _state = SMProgressHUDStateStatic;
        
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window setBackgroundColor:[UIColor clearColor]];
        [_window setWindowLevel:UIWindowLevelAlert];
        [_window makeKeyAndVisible];
        [_window setHidden:YES];
        
        _maskLayer = [[UIView alloc] initWithFrame:_window.bounds];
        [_maskLayer setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
        [_maskLayer setAlpha:0];
        [_window addSubview:_maskLayer];
        
    }
    return self;
}

#pragma mark - LoadingView
#pragma mark 获取loadingview
- (SMProgressHUDLoadingView *)loadingView
{
    if (!_loadingView)
    {
        _loadingView = [[SMProgressHUDLoadingView alloc] initWithFrame:CGRectMake(0, 0, kSMProgressHUDContentWidth, kSMProgressHUDContentHeight)];
        [_loadingView setCenter:CGPointMake(kSMProgressWindowWidth/2, kSMProgressWindowHeight/2)];
    }
    [_loadingView setAlpha:0];
    return _loadingView;
}

- (void)showLoadingWithTip:(NSString *)tip
{
    if (SMProgressHUDStateLoading == _state)
    {
        _loadingCount += 1;
        [_timer invalidate];
        _timer = [NSTimer timerWithTimeInterval:kSMProgressHUDLoadingDelay target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        return;
    }
    
    [_window setHidden:NO];
    [_window addSubview:self.loadingView];
    _state = SMProgressHUDStateLoading;
    _loadingCount += 1;
    [UIView animateWithDuration:kSMProgressHUDAnimationDuration animations:^{
        [_maskLayer setAlpha:1];
        [_loadingView setAlpha:1];
    } completion:^(BOOL finished) {
        if (finished)
        {
            _timer = [NSTimer timerWithTimeInterval:kSMProgressHUDLoadingDelay target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
            [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        }
    }];
    
    
}

#pragma mark 消失
- (void)dismiss
{
    if (_state == SMProgressHUDStateStatic)
    {
        return;
    }
    else if (_state == SMProgressHUDStateLoading)
    {
        if (--_loadingCount)
        {
            return;
        }
    }
    
    switch (_state)
    {
        case SMProgressHUDStateLoading:
        {
            [_timer invalidate];
            _state = SMProgressHUDStateStatic;
            _loadingCount = 0;
            [UIView animateWithDuration:kSMProgressHUDAnimationDuration animations:^{
                [_maskLayer setAlpha:0];
                [_loadingView setAlpha:0];
            } completion:^(BOOL finished) {
                [_window setHidden:YES];
                [_loadingView removeFromSuperview];
            }];
            break;
        }
        default:
            break;
    }
    
}
@end
