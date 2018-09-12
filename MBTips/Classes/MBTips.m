//
//  MBTips.m
//  mb
//
//  Created by hz on 2018/8/24.
//  Copyright © 2018年 Meibei. All rights reserved.
//

#import "MBTips.h"

@implementation MBTips

+ (void)showTipWithText:(NSString *)text
{
    [self showTipWithText:text inView:DefaultTipsParentView];
}

+ (void)showTipWithText:(NSString *)text inView:(UIView *)view
{
    [self showTipWithText:text inView:view hideAfterDelay:2 style:MBTipsStyleDefault];
}

/**
 页面顶部信息提示
 
 @param text 提示内容
 @param view 如果 view 是 viewController.view，则 tips 顶边缘将会紧贴 navigationBar 的底边缘。而如果 view 是 navigationController.view，则 tips 顶边缘将会紧贴 statusBar 的底边缘
 @param delay 自动隐藏 toast 秒数
 @param style 默认字是白色, 背景粉红, LightContent 则是反色
 */
+ (void)showTipWithText:(NSString *)text inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay style:(MBTipsStyle)style
{
    if (!text.length) {
        return;
    }
    
    if(!view) {
        view = DefaultTipsParentView;
    }
    
    UIColor *frontColor; //前景色
    UIColor *backgroundColor; //后景色
    
    if (style == MBTipsStyleDefault) {
        frontColor = [UIColor whiteColor];
        backgroundColor = UIColorMake(255, 102, 102);
    }
    else
    {
        frontColor = UIColorMake(255, 102, 102);
        backgroundColor = [UIColor whiteColor];
    }
    
    QMUIToastView *toastView = [[QMUIToastView alloc] initWithView:view];
    [view addSubview:toastView];
    toastView.removeFromSuperViewWhenHide = YES;
    toastView.toastPosition = QMUIToastViewPositionTop;
//    toastView.toastAnimator = ({
//        QMUIToastAnimator *toastAnimator = [[QMUIToastAnimator alloc] initWithToastView:toastView];
//        toastAnimator.animationType = QMUIToastAnimationTypeSlide;
//        toastAnimator;
//    });
    
    QMUIToastContentView *contentView = toastView.contentView;
    contentView.customView = ({
        CGFloat width = CGRectGetWidth(UIScreen.mainScreen.bounds) - 15 * 2; //左右间距15
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMakeWithSize(CGSizeMake(width, 30))];
        textLabel.text = text;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = [UIFont systemFontOfSize:12];
        textLabel.textColor = frontColor;
        textLabel;
    });
    contentView.insets = UIEdgeInsetsZero;
    
    QMUIToastBackgroundView *backgroundView = toastView.backgroundView;
    backgroundView.styleColor = backgroundColor;
    backgroundView.cornerRadius = 3;
    
    [toastView showAnimated:YES];
    
    if (delay == QMUITipsAutomaticallyHideToastSeconds) {
        [toastView hideAnimated:YES afterDelay:[QMUITips smartDelaySecondsForTipsText:text]];
    } else if (delay > 0) {
        [toastView hideAnimated:YES afterDelay:delay];
    }
}

@end
