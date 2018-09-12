//
//  MBTips.h
//  mb
//
//  Created by hz on 2018/8/24.
//  Copyright © 2018年 Meibei. All rights reserved.
//

#import <QMUIKit/QMUIKit.h>

typedef NS_ENUM(NSInteger, MBTipsStyle) {
    MBTipsStyleDefault = 0,
    MBTipsStyleLightContent,
};

@interface MBTips : NSObject

+ (void)showTipWithText:(NSString *)text;

+ (void)showTipWithText:(NSString *)text inView:(UIView *)view;

/**
 页面顶部信息提示
 
 @param text 提示内容
 @param view 如果 view 是 viewController.view，则 tips 顶边缘将会紧贴 navigationBar 的底边缘。而如果 view 是 navigationController.view，则 tips 顶边缘将会紧贴 statusBar 的底边缘
 @param delay 自动隐藏 toast 秒数
 @param style 默认字是白色, 背景粉红, LightContent 则是反色
 */
+ (void)showTipWithText:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay style:(MBTipsStyle)style;

@end
