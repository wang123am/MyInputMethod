//
//  LWBaseKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWBaseKeyboard.h"
#import "LWKeyKBBtn.h"
#import "LWCharKBBtn.h"
#import "LWBaseKBBtn.h"
#import "LWKeyboardConfig.h"
#import "UIImage+Color.h"

@implementation LWBaseKeyboard

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }

    return self;
}


- (void)removeFromSuperview {
    [self removeKeyboardConstraints];
    [super removeFromSuperview];
}


/**
* 给键盘设置约束
*/
- (void)setupKeyboardConstraints {
    //keyboard加约束
    self.translatesAutoresizingMaskIntoConstraints = NO;
    _keyboardHorizonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[keyboard]|" options:0 metrics:nil views:@{@"keyboard" : self}];
    _keyboardVerticelConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[keyboard]|" options:0 metrics:nil views:@{@"keyboard" : self}];
    [NSLayoutConstraint activateConstraints:_keyboardHorizonConstraints];
    [NSLayoutConstraint activateConstraints:_keyboardVerticelConstraints];
}

/**
* 移除约束
*/
-(void)removeKeyboardConstraints{
    //移除约束
    [NSLayoutConstraint deactivateConstraints:_keyboardHorizonConstraints];
    [NSLayoutConstraint deactivateConstraints:_keyboardVerticelConstraints];
    self.translatesAutoresizingMaskIntoConstraints = YES;
    _keyboardHorizonConstraints = nil;
    _keyboardVerticelConstraints = nil;
}

/**
* 设置背景颜色
*/
-(void)setupBackgroundColor:(UIColor *)color{
    self.backgroundColor = color;
}

/**
* 设置背景图片
*/
-(void)setupBackground:(UIImage *)image{
    self.layer.contents = (__bridge id)image.CGImage;
    self.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.layer.contentsGravity = kCAGravityResizeAspectFill;
}

/**
* 设置键盘提示文字
*/
-(void)setBtnTip:(NSString *)tip withTag:(NSInteger)tag{
    LWBaseKBBtn *btn = (LWBaseKBBtn *) [self viewWithTag:tag];

    [btn setupTip:tip];
}

/**
* 设置字符按键显示及事件处理
*/
- (void)setupCharKBBtns:(NSDictionary *)charTextTagDict {

    __block LWCharKBBtn *charKBBtn = nil;
    [charTextTagDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *tag, BOOL *stop) {

        charKBBtn = (LWCharKBBtn *) [self viewWithTag:tag.intValue];

        //设置字符键内容
        NSArray *charTextArr = [key componentsSeparatedByString:@"|"];

        //如果是图片
        if (charTextArr.count && [charTextArr[0] isEqualToString:@"image"]) {
            NSArray *imgNameArr = [charTextArr[1] componentsSeparatedByString:@","];

            UIImage *normalImg = [[UIImage imageNamed:imgNameArr[0]] imageWithOverlayColor:COLOR_KBBTN_IMG_NORMAL];
            [charKBBtn setImage:normalImg forState:UIControlStateNormal];

            //处理高亮图片
            UIImage *highlightedImg = [[UIImage imageNamed:imgNameArr[0]] imageWithOverlayColor:COLOR_KBBTN_IMG_HIGHLIGHT];
            if(imgNameArr.count > 1){
                highlightedImg = [UIImage imageNamed:imgNameArr[1]];
            }
            [charKBBtn setImage:highlightedImg forState:UIControlStateHighlighted];

        } else {
            //如果是字符
            [charKBBtn setTopText:charTextArr[0] text:charTextArr[1]];
        }
        charKBBtn.dicTag = tag;

        //添加点击事件响应，以及上滑，长按手势处理
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchCancel:) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchUpOutside];

        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(charKBBtnSwip:)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(charKBBtnPan:)];
//        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnLongPress:)];

//        [charKBBtn addGestureRecognizer:longPressGesture];
        [charKBBtn addGestureRecognizer:swipeGesture];
        [charKBBtn addGestureRecognizer:panGestureRecognizer];

    }];
}


/**
* 设置功能按键显示及事件处理
*/
- (void)setupKeyKBBtns:(NSDictionary *)keyTextTagDict {

    __block LWKeyKBBtn *keyKBBtn = nil;
    [keyTextTagDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *tag, BOOL *stop) {

        keyKBBtn = (LWKeyKBBtn *) [self viewWithTag:tag.intValue];
        //设置功能按键内容
        NSArray *keyTextArr = [key componentsSeparatedByString:@"|"];

        //如果是图片
        if (keyTextArr.count && [keyTextArr[0] isEqualToString:@"image"]) {
            NSArray *imgNameArr = [keyTextArr[1] componentsSeparatedByString:@","];

            UIImage *normalImg = [[UIImage imageNamed:imgNameArr[0]] imageWithOverlayColor:COLOR_KBBTN_IMG_NORMAL];
            [keyKBBtn setImage:normalImg forState:UIControlStateNormal];

            //处理高亮图片
            UIImage *highlightedImg = [[UIImage imageNamed:imgNameArr[0]] imageWithOverlayColor:COLOR_KBBTN_IMG_HIGHLIGHT];
            if(imgNameArr.count > 1){
                highlightedImg = [UIImage imageNamed:imgNameArr[1]];
            }
            [keyKBBtn setImage:highlightedImg forState:UIControlStateHighlighted];

        } else {
            //如果是字符
            keyKBBtn.text = keyTextArr[0];
        }
        keyKBBtn.dicTag = tag;

        //添加点击事件响应，以及上滑，长按手势处理
        [keyKBBtn addTarget:self action:@selector(keyKBBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
        [keyKBBtn addTarget:self action:@selector(keyKBBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [keyKBBtn addTarget:self action:@selector(keyKBBtnTouchCancel:) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchUpOutside];

        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnLongPress:)];
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnSwip:)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;

        [keyKBBtn addGestureRecognizer:longPressGesture];
        [keyKBBtn addGestureRecognizer:swipeGesture];

    }];
}

#pragma mark CharKBBtn's Touch and Gesture Event

- (void)charKBBtnTouchDown:(LWCharKBBtn *)charKBBtn{
    [self.delegate kbBtnTouchDown:charKBBtn];
}

- (void)charKBBtnTouchRepeat:(LWCharKBBtn *)charKBBtn {
    [self.delegate kbBtnTouchRepeat:charKBBtn];
}

- (void)charKBBtnTouchUpInside:(LWCharKBBtn *)charKBBtn {
    [self.delegate kbBtnTouchUpInside:charKBBtn];
}

- (void)charKBBtnTouchCancel:(LWCharKBBtn *)charKBBtn {
    [self.delegate kbBtnTouchCancel:charKBBtn];
}

- (void)charKBBtnSwip:(UISwipeGestureRecognizer *)PanGesture {
    [self.delegate kbBtnSwipe:PanGesture];
}

- (void)charKBBtnPan:(UIPanGestureRecognizer *)panGesture {
    [self.delegate kbBtnPan:panGesture];
}

#pragma mark KeyKBBtn's Touch and Gesture Event

- (void)keyKBBtnTouchDown:(LWKeyKBBtn *)keyKBBtn {
    [self.delegate kbBtnTouchDown:keyKBBtn];
}

- (void)keyKBBtnTouchUpInside:(LWKeyKBBtn *)keyKBBtn {

    //分条件处理不同的功能键
    if([keyKBBtn isMemberOfClass:[LWNextBtn class]]){
        [self.delegate switchInputMethod];
    }
    if([keyKBBtn isMemberOfClass:[LWZhEnBtn class]]){
        //先把当前键盘类型保存到lastKeyboardType
        [LWKeyboardConfig setLastZhKeyboardType:[LWKeyboardConfig currentKeyboardType]];
        //再切换到英文键盘
        [self.delegate swithcKeyboard:Keyboard_ENFull];
    }
    if([keyKBBtn isMemberOfClass:[LWEnZhBtn class]]){
        //先把当前键盘类型保存到lastKeyboardType
        KeyboardType type = [LWKeyboardConfig lastZhKeyboardType];
        //再切换到英文键盘
        [self.delegate swithcKeyboard:type];
    }

    if([keyKBBtn isMemberOfClass:[LWBackBtn class]]){
        KeyboardType type = [LWKeyboardConfig lastKeyboardType];
        [self.delegate swithcKeyboard:type];
    }
    if([keyKBBtn isMemberOfClass:[LWNumKeyBtn class]]){
        [LWKeyboardConfig setLastKeyboardType:[LWKeyboardConfig currentKeyboardType]];
        [self.delegate swithcKeyboard:Keyboard_NumNine];
    }

    else{
        [self.delegate kbBtnTouchUpInside:keyKBBtn];
    }

}

- (void)keyKBBtnTouchCancel:(LWKeyKBBtn *)keyKBBtn {
    [self.delegate kbBtnTouchCancel:keyKBBtn];
}

- (void)keyKBBtnLongPress:(UILongPressGestureRecognizer *)longPressGesture {
    [self.delegate kbBtnLongPress:longPressGesture];
}

- (void)keyKBBtnSwip:(UISwipeGestureRecognizer *)swipeGesture {
    [self.delegate kbBtnSwipe:swipeGesture];
}

- (void)keyKBBtnPan:(UIPanGestureRecognizer *)panGesture {
    [self.delegate kbBtnPan:panGesture];
}

@end
