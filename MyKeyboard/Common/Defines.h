//
//  Defines.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#ifndef MyInputMethod_Defines____FILEEXTENSION___
#define MyInputMethod_Defines____FILEEXTENSION___

#ifdef DEBUG
#define Log(format, ...) NSLog(format, ## __VA_ARGS__)
#else
    #define Log(format, ...)
#endif

//按键/阴影颜色
#define COLOR_KBBTN_CONTENTVIEW [UIColor lightGrayColor].CGColor
#define COLOR_SHADOWLAYER [UIColor blackColor].CGColor
//按键/阴影圆角半径
#define R_KBBTN_CONTENTVIEW 5.0
#define R_SHADOWLAYER 5.0
//按键阴影偏移距离
#define OFFSET_SHADOWLAYER 0.5
//按阴影高度
#define HEIGHT_SHADOWLAYER 10.0

//btn的background横向与纵向的半倍间隙
#define SPACE_BTN_BG_HORIZON 4.0
#define SPACE_BTN_BG_VERTICAL 4.0

//横屏键盘高度
#define KEYBOARD_LANDSCAPE_HEIGHT 216.0
//竖屏键盘高度
#define KEYBOARD_HEIGHT 256.0

////FullKeyboard字符按键文本Tag字典
//#define FULLKEYABOARD_CHAR_TEXT_TAG_DICT @{@"Q":@101,@"W":@102,@"E":@103,@"R":@104,@"T":@105,@"Y":@106,@"U":@107,@"I":@108,@"O":@109,@"P":@110,\
//                             @"A":@201,@"S":@202,@"D":@203,@"F":@204,@"G":@205,@"H":@206,@"J":@207,@"K":@208,@"L":@209,\
//                             @"Z":@302,@"X":@303,@"C":@304,@"V":@305,@"B":@306,@"N":@307,@"M":@308,  @"image|space_normal":@404,@"。，":@405 }
////FullKeyboard功能按键文本Tag字典
//#define FULLKEYBOARD_KEY_TEXT_TAG_DICT @{@"符":@301,@"image|delete_normal":@309,@"ABC":@401,@"image|next_normal":@402, NSLocalizedString(@"BreakLine", nil):@406}



#endif
