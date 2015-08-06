//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWKeyboardWrap.h"
#import "LWBaseKeyboard.h"


@implementation LWKeyboardWrap {

}

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    if([view isKindOfClass:[LWBaseKeyboard class]]){
        LWBaseKeyboard *keyboard = (LWBaseKeyboard *)view;
        [keyboard setupKeyboardConstraints];
    }
}


@end
