//
//  LWEnFullKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWEnFullKeyboard.h"
#import "LWKeyboardConfig.h"

@implementation LWEnFullKeyboard

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCharKBBtns:[LWKeyboardConfig enFullKBCharTextTagDict]];
        [self setupKeyKBBtns:[LWKeyboardConfig enFullKBKeyTextTagDict]];
    }

    return self;
}


@end
