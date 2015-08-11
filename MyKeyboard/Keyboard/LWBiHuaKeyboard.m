//
// Created by luowei on 15/8/10.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWBiHuaKeyboard.h"
#import "LWKeyboardConfig.h"


@implementation LWBiHuaKeyboard {

}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCharKBBtns:[LWKeyboardConfig biHuaKBCharTextTagDict]];
        [self setupKeyKBBtns:[LWKeyboardConfig biHuaKBKeyTextTagDict]];
        [self setBtnTip:@"笔画" withTag:404];
    }

    return self;
}

@end