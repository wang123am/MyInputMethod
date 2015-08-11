//
//  LWKeyboardConfig.h
//  MyInputMethod
//  用于维护与键盘设置相关的配置与数据
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "LWDefines.h"

@interface LWKeyboardConfig : NSObject

/**
* 英文全键字符键text->tag字典
*/
+(NSDictionary *)enFullKBCharTextTagDict;

/**
* 英文全键功能键text->tag字典
*/
+(NSDictionary *)enFullKBKeyTextTagDict;

/**
* 拼音全键字符键text->tag字典
*/
+(NSDictionary *)pinYinFullKBCharTextTagDict;

/**
* 拼音全键功能键text->tag字典
*/
+(NSDictionary *)pinYinFullKBKeyTextTagDict;

+(NSDictionary *)pinYinNineKBCharTextTagDict;

+(NSDictionary *)pinYinNineKBKeyTextTagDict;

+(NSDictionary *)numNineKBCharTextTagDict;

+(NSDictionary *)numNineKBKeyTextTagDict;

/**
* 获得单手模式类型
*/
+ (SingleHandMode)singleHandMode;

/**
* 获得键盘的皮肤
*/
+ (UIImage *)keyboardSkin;

/**
* 候选板类型
*/
+ (PredictiveMode)predictiveMode;

/**
* 当前键盘类型
*/
+ (KeyboardType)currentKeyboardType;

/**
* 上次键盘类型
*/
+ (KeyboardType)lastKeyboardType;

/**
* 设置上次键盘类型
*/
+ (void)setLastKeyboardType:(KeyboardType)type;

/**
* 设置当前键盘类型
*/
+ (void)setCurrentKeyboardType:(KeyboardType)type;

+ (void)setLastZhKeyboardType:(KeyboardType)type;

+ (KeyboardType)lastZhKeyboardType;

+ (NSArray *)getOftenuseWords;

/**
* 获得是否开启完全访问权限
*/
+ (BOOL)isFullAccessGranted;

+ (NSDictionary *)biHuaKBCharTextTagDict;

+ (NSDictionary *)biHuaKBKeyTextTagDict;

+ (NSDictionary *)wubiFullKBCharTextTagDict;

+ (NSDictionary *)wubiFullKBKeyTextTagDict;
@end
