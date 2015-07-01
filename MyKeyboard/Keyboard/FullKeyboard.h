//
//  FullKeyboard.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "BaseKeyboard.h"

@interface FullKeyboard : BaseKeyboard


//设置功能按键显示及事件处理
- (void)setKeyKBBtns:(NSDictionary *)keyTextTagDict;

//设置字符按键显示及事件处理
- (void)setCharKBBtns:(NSDictionary *)charTextTagDict;

@end
