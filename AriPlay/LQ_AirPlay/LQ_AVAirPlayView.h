//
//  LQ_AVAirPlayView.h
//  LQ_AirPlay
//
//  Created by liuhongfei on 2019/11/4.
//  Copyright © 2019 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQ_AVAirPlayView : UIView

/**
 *  iOS11 之后的投屏方法
 *
 *  @param  frame            Frame
 *  @param  URLStr           视频地址
 */
- (instancetype)avAirPlayViewWithFrame:(CGRect)frame
                                URLStr:(NSString *)URLStr;

@end

NS_ASSUME_NONNULL_END
