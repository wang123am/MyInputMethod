//
//  FullKeyboard.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "FullKeyboard.h"
#import "Defines.h"
#import "CharKBBtn.h"
#import "KeyKBBtn.h"
#import "KeyboardConfig.h"


@implementation FullKeyboard {
    
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
//    Log(@"--------%d:%s：", __LINE__, __func__);
    
    if (self) {
//        [self setUpFullKeyboard];
        if([KeyboardConfig currentTheme]){
            NSDictionary *rootDic = [KeyboardConfig currentTheme];

            UIImage *bigImage = [UIImage imageNamed:rootDic[@"meta"][@"image"]];
            CGFloat bigWidth = ((NSNumber *) rootDic[@"meta"][@"width"]).floatValue;
            CGFloat bigHeight = ((NSNumber *) rootDic[@"meta"][@"height"]).floatValue;

            NSDictionary *rectDict = rootDic[@"frames"][@"background"];
            CGFloat x = ((NSNumber *) rectDict[@"x"]).floatValue / bigWidth;
            CGFloat y = ((NSNumber *) rectDict[@"y"]).floatValue / bigHeight;
            CGFloat width = ((NSNumber *) rectDict[@"w"]).floatValue / bigWidth;
            CGFloat height = ((NSNumber *) rectDict[@"h"]).floatValue / bigHeight;

            [self setupBackground:bigImage];
            self.layer.contentsRect = CGRectMake(x, y, width, height);
        }
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

//    Log(@"--------%d:%s：", __LINE__, __func__);
}

//设置全键盘
- (void)setupKeyboard:(KBKeyboardType)keyboardType {
    [super setupKeyboard:keyboardType];
    
    switch (keyboardType) {
        case KBKeyboard_ENFull: {
            [self setupCharKBBtns:[KeyboardConfig enFullKBCharTextTagDict]];
            [self setupKeyKBBtns:[KeyboardConfig enFullKBKeyTextTagDict]];
            break;
        };
        case KBKeyboard_PingYingFull: {
            [self setupCharKBBtns:[KeyboardConfig pingYingFullKBCharTextTagDict]];
            [self setupKeyKBBtns:[KeyboardConfig pingYingFullKBKeyTextTagDict]];

/*
            NSString *key = @"image|space,space_Highlighted";
            NSArray *charTextArr = [key componentsSeparatedByString:@"|"];
            if (charTextArr.count && [charTextArr[0] isEqualToString:@"image"]) {
                NSArray *imgNameArr = [charTextArr[1] componentsSeparatedByString:@","];
                CharKBBtn *charKBBtn = (CharKBBtn *) [self viewWithTag:404];
                [charKBBtn setImage:[UIImage imageNamed:imgNameArr[0]] forState:UIControlStateNormal];
//              [_aView setImage:[UIImage imageNamed:imgNameArr[1]] forState:UIControlStateHighlighted];
            }
*/
            
            break;
        };
        default: {
            break;
        }
    }
    
}

//设置字符按键显示及事件处理
- (void)setupCharKBBtns:(NSDictionary *)charTextTagDict {
    
    __block CharKBBtn *charKBBtn = nil;
//    [charTextTagDict keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(NSString *key, NSNumber *tag, BOOL *stop) {
    [charTextTagDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *tag, BOOL *stop) {
    
        charKBBtn = (CharKBBtn *) [self viewWithTag:tag.intValue];
    
        //设置字符键内容
        NSArray *charTextArr = [key componentsSeparatedByString:@"|"];
        //如果是图片
        if (charTextArr.count && [charTextArr[0] isEqualToString:@"image"] && ![KeyboardConfig currentTheme]) {
            NSArray *imgNameArr = [charTextArr[1] componentsSeparatedByString:@","];
            [charKBBtn setImage:[UIImage imageNamed:imgNameArr[0]] forState:UIControlStateNormal];
//        [_aView setImage:[UIImage imageNamed:imgNameArr[1]] forState:UIControlStateHighlighted];
        
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
    
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnSwip:)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnPanUp:)];
//        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnLongPress:)];

//        [charKBBtn addGestureRecognizer:longPressGesture];
        [charKBBtn addGestureRecognizer:swipeGesture];
        [charKBBtn addGestureRecognizer:panGestureRecognizer];

//        return NO;
    }];
}


//设置功能按键显示及事件处理
- (void)setupKeyKBBtns:(NSDictionary *)keyTextTagDict {
    
    __block KeyKBBtn *keyKBBtn = nil;
//    [keyTextTagDict keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(NSString *key, NSNumber *tag, BOOL *stop) {
    
    [keyTextTagDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *tag, BOOL *stop) {
    
        keyKBBtn = (KeyKBBtn *) [self viewWithTag:tag.intValue];
        //设置功能按键内容
        NSArray *keyTextArr = [key componentsSeparatedByString:@"|"];

        //如果是图片
        if (keyTextArr.count && [keyTextArr[0] isEqualToString:@"image"] && ![KeyboardConfig currentTheme]) {
            NSArray *imgNameArr = [keyTextArr[1] componentsSeparatedByString:@","];
            [keyKBBtn setImage:[UIImage imageNamed:imgNameArr[0]] forState:UIControlStateNormal];
            [keyKBBtn setImage:[UIImage imageNamed:imgNameArr[1]] forState:UIControlStateHighlighted];

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

//        return NO;
    }];
}


#pragma mark CharKBBtn's Touch and Gesture Event

- (void)charKBBtnTouchDown:(CharKBBtn *)charKBBtnTouchDown {
    
}

- (void)charKBBtnTouchRepeat:(CharKBBtn *)charKBBtnTouchRepeat {
    
}

- (void)charKBBtnTouchUpInside:(CharKBBtn *)charKBBtnTouchUpInside {
    
}

- (void)charKBBtnTouchCancel:(CharKBBtn *)charKBBtnTouchCancel {
    
}


#pragma mark KeyKBBtn's Touch and Gesture Event

- (void)keyKBBtnTouchDown:(KeyKBBtn *)keyKBBtnTouchDown {
    
}

- (void)keyKBBtnTouchUpInside:(KeyKBBtn *)keyKBBtnTouchUpInside {
    
}

- (void)keyKBBtnTouchCancel:(KeyKBBtn *)keyKBBtnTouchCancel {
    
}

- (void)keyKBBtnLongPress:(KeyKBBtn *)keyKBBtnLongPress {
    
}

- (void)keyKBBtnSwip:(KeyKBBtn *)keyKBBtnSwip {
    
}

- (void)keyKBBtnPanUp:(KeyKBBtn *)keyKBBtnPanUp {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
