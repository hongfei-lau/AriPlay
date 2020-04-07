//
//  ViewController.m
//  AriPlay
//
//  Created by liuhongfei on 2020/4/7.
//  Copyright © 2020 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "LQ_AriPlayDefines.h"
#import "LQ_AVAirPlayView.h"
#import "LQ_MPAirPlayView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // iOS11以后使用的方法  iOS11之前请使用LQ_MPAirPlayView
    LQ_AVAirPlayView *AVAirPlayView = [[LQ_AVAirPlayView alloc] avAirPlayViewWithFrame:CGRectMake(0, LQScalingStyle(122), LQScreenW, LQScalingStyle(118)) URLStr:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    
    [self.view addSubview:AVAirPlayView];
}

@end
