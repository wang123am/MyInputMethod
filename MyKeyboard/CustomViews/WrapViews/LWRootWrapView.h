//
// Created by luowei on 15/8/5.
// Copyright (c) 2015 luowei. All rights reserved.
//


#import <UIKit/UIKit.h>

@class LWSettingPopView;
@class LWOftenWordsPopView;

@interface LWRootWrapView : UIView

/**
* 添加logoPop弹窗
*/
- (void)addLogoPop:(UIView *)btn;

/**
* 删除logoPop弹窗
*/
- (void)removeLogoPop;

/**
* 添加表情键盘Pop
*/
- (void)addEmojiPop:(UIView *)btn;

/**
* 删除表情键盘Pop
*/
- (void)removeEmojiPop;

/**
* 添加常用语Pop
*/
- (void)addOftenWordsPop:(UIView *)btn;

/**
* 删除常用语Pop
*/
- (void)removeOftenWordsPop;

/**
* 添加切换键盘Pop
*/
- (void)addNextPop:(UIView *)btn;

/**
* 删除切换键盘Pop
*/
- (void)removeNextPop;

/**
* 添加全键盘按键Pop
*/
- (void)addFullCharBtnPop:(UIView *)btn;

/**
* 删除全键盘按键Pop
*/
- (void)removeFullCharBtnPop;

@end