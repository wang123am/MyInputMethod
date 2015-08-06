//
//  LWFullKeyboard.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWBaseKeyboard.h"

@interface LWFullKeyboard : LWBaseKeyboard


//设置功能按键显示及事件处理
- (void)setupKeyKBBtns:(NSDictionary *)keyTextTagDict;

//设置字符按键显示及事件处理
- (void)setupCharKBBtns:(NSDictionary *)charTextTagDict;

@end
