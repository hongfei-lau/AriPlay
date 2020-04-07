//
//  LQ_MPAirPlayView.h
//  LQ_AirPlay
//
//  Created by liuhongfei on 2019/11/4.
//  Copyright © 2019 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQ_MPAirPlayView : UIView

/**
 *  iOS9 之前的投屏方法
 *
 *  @param  frame            Frame
 *  @param  URLStr           视频地址
 */
- (instancetype)mpAirPlayViewWithFrame:(CGRect)frame
                                URLStr:(NSString *)URLStr;

@end

NS_ASSUME_NONNULL_END
