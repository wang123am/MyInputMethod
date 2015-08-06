//
// Created by luowei on 15/7/30.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWDefines.h"


@interface LWKeyboardLogic : NSObject

/**
* 根据输入框的UIKeyboardType得到KeyboardType
*/
+ (KeyboardType)keyboardTypeWith:(UIKeyboardType)type;

@end
