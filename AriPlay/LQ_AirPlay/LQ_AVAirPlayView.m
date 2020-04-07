//
//  LQ_AVAirPlayView.m
//  LQ_AirPlay
//
//  Created by liuhongfei on 2019/11/4.
//  Copyright © 2019 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#import "LQ_AVAirPlayView.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface LQ_AVAirPlayView () <AVRoutePickerViewDelegate>{
    AVPlayer *_player;                 // AVFoundation
    AVPlayerViewController *_playerVC; // AVKit
}

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, copy) NSString *URLStr;

@end

@implementation LQ_AVAirPlayView

- (void)dealloc {
    NSLog(@"AVAirPlay_Dealloc");
}

- (instancetype)avAirPlayViewWithFrame:(CGRect)frame
                                URLStr:(NSString *)URLStr
{
    if ([super initWithFrame:frame]) {
        self.URLStr = URLStr;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(13, (self.frame.size.height - 22) / 2, 22, 22)];
    _iconImageView.image = [UIImage imageNamed:@"airplay_icon"];
    [self addSubview:_iconImageView];
    
    if (@available(iOS 11.0, *)) {
        NSString *path = self.URLStr;
        NSURL *url = [NSURL URLWithString:path];
        
        _player = [[AVPlayer alloc] initWithURL:url];
        
        _playerVC = [[AVPlayerViewController alloc] init];
        _playerVC.view.frame = self.bounds;
            [[self getCurrentVC].view addSubview: _playerVC.view];
        _playerVC.showsPlaybackControls = NO;
        
        _playerVC.videoGravity = AVLayerVideoGravityResizeAspect;
        _playerVC.view.translatesAutoresizingMaskIntoConstraints = YES;
        _playerVC.player = _player;
        // [_playerVC.player play];
        
        AVRoutePickerView *pickerView = [[AVRoutePickerView alloc] initWithFrame:self.bounds];
        // 活跃状态颜色
        pickerView.activeTintColor = [UIColor clearColor];
        // 设置代理
        pickerView.delegate = self;
        [self addSubview:pickerView];

        for (UIButton *button in pickerView.subviews) {
            NSLog(@"%@",button);
            if ([button isKindOfClass:[UIButton class]]) {
                button.alpha = 0;
            }
        }
    } else {
        // Fallback on earlier versions
    }
}

// AirPlay界面弹出时回调
- (void)routePickerViewWillBeginPresentingRoutes:(AVRoutePickerView *)routePickerView API_AVAILABLE(ios(11.0)){
    NSLog(@"AirPlay界面弹出时回调");
}
// AirPlay界面结束时回调
- (void)routePickerViewDidEndPresentingRoutes:(AVRoutePickerView *)routePickerView API_AVAILABLE(ios(11.0)){
    NSLog(@"AirPlay界面结束时回调");
}

- (UIViewController *)getCurrentVC {
    // 获得当前活动窗口的根视图
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        // 根据不同的页面切换方式，逐步取得最上层的viewController
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        } else {
            break;
        }
    }
    return vc;
}

@end
