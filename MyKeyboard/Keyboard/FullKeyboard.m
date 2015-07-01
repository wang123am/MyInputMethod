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
#import "KBLabel.h"
#import "KeyKBBtn.h"


@implementation FullKeyboard {

}

- (void)awakeFromNib {
    [super awakeFromNib];

    //约定:1.按键上下字符内容以 | 分隔,没有分隔默认填充为按键下方字符；2.如果分隔符左边为 image,则设置image；
    NSDictionary *fullKeyboard_zh_char_text_tag_dict = @{@"1|Q" : @101, @"2|W" : @102, @"3|E" : @103, @"4|R" : @104, @"5|T" : @105, @"6|Y" : @106, @"7|U" : @107, @"8|I" : @108, @"9|O" : @109, @"0|P" : @110,
            @"@|A" : @201, @"~|S" : @202, @"?|D" : @203, @"…|F" : @204, @"；|G" : @205, @"：|H" : @206, @"、|J" : @207, @"（|K" : @208, @"）|L" : @209,
            @".|Z" : @302, @"！|X" : @303, @"=|C" : @304, @"“|V" : @305, @"”|B" : @306, @"《|N" : @307, @"》|M" : @308, @"image|space_normal,space_Highlighted" : @404, @"。|，" : @405};
    NSDictionary *fullKeyboard_en_char_text_tag_dict = @{@"1|q" : @101, @"2|w" : @102, @"3|e" : @103, @"4|r" : @104, @"5|t" : @105, @"6|y" : @106, @"7|u" : @107, @"8|i" : @108, @"9|o" : @109, @"0|p" : @110,
            @"@|a" : @201, @"~|s" : @202, @"?|d" : @203, @"…|f" : @204, @"；|g" : @205, @"：|h" : @206, @"、|j" : @207, @"（|k" : @208, @"）|l" : @209,
            @".|z" : @302, @"！|x" : @303, @"=|c" : @304, @"“|v" : @305, @"”|b" : @306, @"《|n" : @307, @"》|m" : @308, @"image|space_normal,space_Highlighted" : @404, @"。|，" : @405};


    NSDictionary *fullKeyboard_Key_text_tag_dict = @{@"符" : @301, @"image|delete_normal,delete_Highlighted" : @309, @"ABC" : @401, @"image|next_normal,next_Highlighted" : @402, NSLocalizedString(@"BreakLine", nil) : @406};

    [self setCharKBBtns:fullKeyboard_Key_text_tag_dict];

    [self setKeyKBBtns:fullKeyboard_Key_text_tag_dict];


}


//设置功能按键显示及事件处理
- (void)setKeyKBBtns:(NSDictionary *)keyTextTagDict {

    __block KeyKBBtn *keyKBBtn = nil;
    [keyTextTagDict keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(NSString *key, NSNumber *tag, BOOL *stop) {

        keyKBBtn = (KeyKBBtn *) [self viewWithTag:tag.intValue];

        //设置功能按键内容
        NSArray *keyTextArr = [key componentsSeparatedByString:@"|"];

        //如果是图片
        if (keyTextArr.count && [keyTextArr[0] isEqualToString:@"image"]) {
            NSArray *imgNameArr = [keyTextArr[1] componentsSeparatedByString:@","];
            [keyKBBtn setImage:[UIImage imageNamed:imgNameArr[0]] forState:UIControlStateNormal];
            [keyKBBtn setImage:[UIImage imageNamed:imgNameArr[1]] forState:UIControlStateHighlighted];

        } else {
            //如果是字符
            keyKBBtn.mainLabel.text = keyTextArr[0];
        }

        //添加点击事件响应，以及上滑，长按手势处理
        [keyKBBtn addTarget:self action:@selector(keyKBBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
        [keyKBBtn addTarget:self action:@selector(keyKBBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [keyKBBtn addTarget:self action:@selector(keyKBBtnTouchCancel:) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside];

        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnLongPress:)];
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnSwip:)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;

        [keyKBBtn addGestureRecognizer:longPressGesture];
        [keyKBBtn addGestureRecognizer:swipeGesture];


        return NO;
    }];
}


//设置字符按键显示及事件处理
- (void)setCharKBBtns:(NSDictionary *)charTextTagDict {

    __block CharKBBtn *charKBBtn = nil;
    [charTextTagDict keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(NSString *key, NSNumber *tag, BOOL *stop) {

        charKBBtn = (CharKBBtn *) [self viewWithTag:tag.intValue];

        //设置字符键内容
        NSArray *charTextArr = [key componentsSeparatedByString:@"|"];
        //如果是图片
        if(charTextArr.count && [charTextArr[0] isEqualToString:@"image"]){
            NSArray *imgNameArr = [charTextArr[1] componentsSeparatedByString:@","];
            [charKBBtn setImage:[UIImage imageNamed:imgNameArr[0]] forState:UIControlStateNormal];
            [charKBBtn setImage:[UIImage imageNamed:imgNameArr[1]] forState:UIControlStateHighlighted];

        }else{
            //如果是字符
            charKBBtn.topLabel.text = charTextArr[0];
            charKBBtn.mainLabel.text = charTextArr[1];

        }

        //添加点击事件响应，以及上滑，长按手势处理
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchDown:) forControlEvents:UIControlEventTouchDown];
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [charKBBtn addTarget:self action:@selector(charKBBtnTouchCancel:) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpOutside];

        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnLongPress:)];
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnSwip:)];
        swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(keyKBBtnPanUp:)];

        [charKBBtn addGestureRecognizer:longPressGesture];
        [charKBBtn addGestureRecognizer:swipeGesture];
        [charKBBtn addGestureRecognizer:panGestureRecognizer];

        return NO;
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
