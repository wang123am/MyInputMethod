//
//  LWCharKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//




#import "LWBaseKBBtn.h"

@interface LWCharKBBtn : LWBaseKBBtn

/**
* 给按键主标签与上标签字符内容
*/
- (void)setTopText:(NSString *)upText text:(NSString *)text;

@end
