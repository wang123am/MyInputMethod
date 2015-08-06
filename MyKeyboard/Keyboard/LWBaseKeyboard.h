//
//  LWBaseKeyboard.h
//  MyInputMethod
//  键盘基类
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWDefines.h"

@class LWCharKBBtn;
@class LWKeyKBBtn;
@class LWBaseKBBtn;


@protocol LWBaseKeyboardDelegate <NSObject>

/**
* 切换输入法
*/
- (void)switchInputMethod;

/**
* 切换键盘
*/
- (void)swithcKeyboard:(KeyboardType)type;

/**
* 按键按下
*/
- (void)kbBtnTouchDown:(LWBaseKBBtn *)btn;

/**
* 按键重复按
*/
- (void)kbBtnTouchRepeat:(LWBaseKBBtn *)btn;

/**
* 按键按下
*/
- (void)kbBtnTouchUpInside:(LWBaseKBBtn *)btn;

/**
* 按键Touch取消
*/
- (void)kbBtnTouchCancel:(LWBaseKBBtn *)btn;

/**
* 按键轻扫
*/
- (void)kbBtnSwipe:(UISwipeGestureRecognizer *)recognizer;

/**
* 按键滑动
*/
- (void)kbBtnPan:(UIPanGestureRecognizer *)recognizer;

/**
* 按键长按
*/
- (void)kbBtnLongPress:(UILongPressGestureRecognizer *)recognizer;


@end

@interface LWBaseKeyboard : UIView

//键盘水平方向上的约束
@property(nonatomic, strong) NSArray *keyboardHorizonConstraints;
//键盘垂直方向上的约束
@property(nonatomic, strong) NSArray *keyboardVerticelConstraints;

@property(nonatomic, weak) id <LWBaseKeyboardDelegate> delegate;


/**
* 给键盘设置约束
*/
- (void)setupKeyboardConstraints;
/**
* 设置背景颜色
*/
- (void)setupBackgroundColor:(UIColor *)color;

/**
* 设置背景图片
*/
- (void)setupBackground:(UIImage *)image;

/**
* 设置字符按键显示及事件处理
*/
- (void)setupCharKBBtns:(NSDictionary *)charTextTagDict;

/**
* 设置功能按键显示及事件处理
*/
- (void)setupKeyKBBtns:(NSDictionary *)keyTextTagDict;


#pragma mark CharKBBtn's Touch and Gesture Event

- (void)charKBBtnTouchDown:(LWCharKBBtn *)charKBBtnTouchDown;

- (void)charKBBtnTouchRepeat:(LWCharKBBtn *)charKBBtnTouchRepeat;

- (void)charKBBtnTouchUpInside:(LWCharKBBtn *)charKBBtnTouchUpInside;

- (void)charKBBtnTouchCancel:(LWCharKBBtn *)charKBBtnTouchCancel;

- (void)charKBBtnPan:(UIPanGestureRecognizer *)panGesture ;

- (void)charKBBtnSwip:(UISwipeGestureRecognizer *)swipeGesture;

#pragma mark KeyKBBtn's Touch and Gesture Event

- (void)keyKBBtnTouchDown:(LWKeyKBBtn *)keyKBBtnTouchDown;

- (void)keyKBBtnTouchUpInside:(LWKeyKBBtn *)keyKBBtnTouchUpInside;

- (void)keyKBBtnTouchCancel:(LWKeyKBBtn *)keyKBBtnTouchCancel;

- (void)keyKBBtnLongPress:(UILongPressGestureRecognizer *)keyKBBtnLongPress;

- (void)keyKBBtnSwip:(UISwipeGestureRecognizer *)keyKBBtnSwip;

- (void)keyKBBtnPan:(UIPanGestureRecognizer *)keyKBBtnPanUp;

@end
