//
//  LQ_MPAirPlayView.m
//  LQ_AirPlay
//
//  Created by liuhongfei on 2019/11/4.
//  Copyright © 2019 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#import "LQ_MPAirPlayView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface LQ_MPAirPlayView ()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) MPMoviePlayerController *MP_Player;
@property (nonatomic, weak) MPVolumeView *MP_AirPlayView;

@property (nonatomic, copy) NSString *URLStr;

@end

@implementation LQ_MPAirPlayView

- (void)dealloc {
    NSLog(@"MPAirPlay_Dealloc");
}

- (instancetype)mpAirPlayViewWithFrame:(CGRect)frame
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
    
    NSURL *url = [NSURL URLWithString:self.URLStr];
    _MP_Player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [_MP_Player prepareToPlay];
    [_MP_Player pause];
    [self addSubview:self.MP_Player.view];
    
    MPVolumeView *MP_AirPlayView = [[MPVolumeView alloc] init];
    _MP_AirPlayView = MP_AirPlayView;
    MP_AirPlayView.frame = self.bounds;
    [MP_AirPlayView setRouteButtonImage:nil forState:UIControlStateNormal];
    [MP_AirPlayView setShowsVolumeSlider:NO];
    [self addSubview:MP_AirPlayView];
    
    for (UIButton *button in MP_AirPlayView.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            button.frame = MP_AirPlayView.bounds;
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mpMediaPlaybackIsPreparedToPlay:) name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mpVolumeViewWirelessRouteActiveDidChange:) name:MPVolumeViewWirelessRouteActiveDidChangeNotification object:nil];
}

- (void)mpMediaPlaybackIsPreparedToPlay:(NSNotification *)noti {
    [self.MP_Player pause];
}

- (void)mpVolumeViewWirelessRouteActiveDidChange:(NSNotification *)noti {
    // 是否在投屏
    if (_MP_AirPlayView.wirelessRouteActive) {
        [self tvActive:YES];
    } else {
        [self tvActive:NO];
    }
    NSLog(@"mpVolumeViewWirelessRouteActiveDidChange===Userinfo:%@",noti.userInfo);
}

- (void)tvActive:(BOOL)isActive {
    if (isActive) {
        if (!_MP_Player.isAirPlayVideoActive) {
            [_MP_Player play];
        }
    } else {
        if (_MP_Player.isAirPlayVideoActive) {
            [_MP_Player pause];
        }
    }
}

@end
