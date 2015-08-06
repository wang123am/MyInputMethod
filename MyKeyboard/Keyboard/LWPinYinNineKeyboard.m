//
//  LWPinYinNineKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWPinYinNineKeyboard.h"
#import "LWKeyboardConfig.h"

@implementation LWPinYinNineKeyboard

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCharKBBtns:[LWKeyboardConfig pinYinNineKBCharTextTagDict]];
        [self setupKeyKBBtns:[LWKeyboardConfig pinYinNineKBKeyTextTagDict]];
    }

    return self;
}

@end
