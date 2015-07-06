//
//  BaseKeyboard.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Defines.h"

@interface BaseKeyboard : UIView

//设置键盘
- (void)setupKeyboard:(KBKeyboardType)keyboardType;


//设置背景颜色
-(void)setupBackgroundColor:(UIColor *)color;

//设置背景图片
-(void)setupBackground:(UIImage *)image;

@end
