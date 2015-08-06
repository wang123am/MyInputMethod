//
//  LWNumKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWNumKeyboard.h"
#import "LWKeyboardConfig.h"
#import "LWNumLeftTabView.h"

@implementation LWNumKeyboard

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCharKBBtns:[LWKeyboardConfig numNineKBCharTextTagDict]];
        [self setupKeyKBBtns:[LWKeyboardConfig numNineKBKeyTextTagDict]];

    }

    return self;
}

@end
