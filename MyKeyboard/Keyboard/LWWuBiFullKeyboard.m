//
// Created by luowei on 15/8/10.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWWuBiFullKeyboard.h"
#import "LWKeyboardConfig.h"


@implementation LWWuBiFullKeyboard {

}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupCharKBBtns:[LWKeyboardConfig wubiFullKBCharTextTagDict]];
        [self setupKeyKBBtns:[LWKeyboardConfig wubiFullKBKeyTextTagDict]];
        [self setBtnTip:@"五笔全键" withTag:404];
    }

    return self;
}



@end