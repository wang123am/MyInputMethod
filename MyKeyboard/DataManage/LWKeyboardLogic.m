//
// Created by luowei on 15/7/30.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWKeyboardLogic.h"
#import "LWDefines.h"


@implementation LWKeyboardLogic {

}
+ (KeyboardType)keyboardTypeWith:(UIKeyboardType)type {

    if (type == UIKeyboardTypeNumbersAndPunctuation || type == UIKeyboardTypeNumberPad
            //            || keyboardType == UIKeyboardTypePhonePad
            || type == UIKeyboardTypeDecimalPad) {
        return Keyboard_NumNine;

    } else if (type == UIKeyboardTypeEmailAddress || type == UIKeyboardTypeURL
            || type == UIKeyboardTypeASCIICapable) {
        return Keyboard_ENFull;
    }

    return Keyboard_PingYingFull;
}
@end
