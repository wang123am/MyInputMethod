//
//  LWPinYinFullKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "LWPinYinFullKeyboard.h"
#import "LWKeyboardConfig.h"

@implementation LWPinYinFullKeyboard

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCharKBBtns:[LWKeyboardConfig pinYinFullKBCharTextTagDict]];
        [self setupKeyKBBtns:[LWKeyboardConfig pinYinFullKBKeyTextTagDict]];
        [self setBtnTip:@"拼音全键" withTag:404];
    }

    return self;
}


@end
