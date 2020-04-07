//
//  LQ_AriPlayDefines.h
//  AriPlay
//
//  Created by liuhongfei on 2020/4/7.
//  Copyright © 2020 BeiJing BoRuiSiYuan Network Technology Co., Ltd. All rights reserved.
//

#ifndef LQ_AriPlayDefines_h
#define LQ_AriPlayDefines_h

#define LQScreenW ([UIScreen mainScreen].bounds.size.width)
#define LQScreenH ([UIScreen mainScreen].bounds.size.height)
/// 纵向机型适配
#define LQScalingStyle(Value) (Value* ((LQScreenW > LQScreenH) ? LQScreenH : LQScreenW)/750)


#endif /* LQ_AriPlayDefines_h */
