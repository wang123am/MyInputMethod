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


typedef NS_OPTIONS(NSUInteger, KBKeyboardType) {
    //常规键盘
    KBKeyboard_ENFull = 0,               //英文全键
    KBKeyboard_PingYingFull = 1 << 0,      //拼音全键
    KBKeyboard_WubiFull = 1 << 1,          //五笔全键
    KBKeyboard_SymbolFull = 1 << 2,        //符号全键
    KBKeyboard_NumNine = 1 << 3,           //数字九键
    KBKeyboard_PingYingNine = 1 << 4,     //拼音九键
    KBKeyboard_SymbolCollection = 1 << 5   //符号方键

    //特定键盘

};

#define WEAKSELF typeof(self) __weak weakSelf = self;


//横屏键盘高度
#define KEYBOARD_LANDSCAPE_HEIGHT 216.0
//竖屏键盘高度
#define KEYBOARD_HEIGHT 256.0



//按键的background横向与纵向的半倍间隙
#define SPACE_BTN_BG_HORIZON 1.0
#define SPACE_BTN_BG_VERTICAL 2.0

//按键外边框圆角半径、宽度、颜色
#define RADIUS_KBBTN_CONTENTVIEW 5.0
#define WIDTH_KBBTN_CONTENTVIEW_BORDER 1.0
#define COLOR_KBBTN_CONTENTVIEW_BORDER [UIColor grayColor].CGColor

//按键内边框宽度及颜色
#define RADIUS_KBBTN_CONTENTVIEW_INNERBORDER 4.0
#define WIDTH_KBBTN_CONTENTVIEW_INNERBORDER 1.0
#define COLOR_KBBTN_CONTENTVIEW_INNERBORDER [UIColor whiteColor].CGColor

//按键背景色
#define COLOR_KBBTN_CONTENTVIEW_BG [UIColor grayColor].CGColor
//按键背景色不透明度
#define OPACITY_KBBTN_CONTENTVIEW_BG 0.2
#define OPACITY_KBBTN_CONTENTVIEW_BG_HIGHLIGHT 0.5



//按键阴影颜色
#define COLOR_SHADOWLAYER [UIColor grayColor].CGColor
//按键阴影偏移距离
#define OFFSET_SHADOWLAYER 0.5
//按键阴影圆角半径
#define RADIUS_SHADOWLAYER  (CGFloat)(RADIUS_KBBTN_CONTENTVIEW+OFFSET_SHADOWLAYER)
//按键阴影高度
#define HEIGHT_SHADOWLAYER 1.0



//按键中mainLabel的字体
#define MAINTEXT_FONT [UIFont systemFontOfSize:17]
#define TOPTEXT_FONT [UIFont systemFontOfSize:9]

//按键中topLb与mainLb的间距
#define SPACE_TOP_MAIN 0.5



//工具栏背景色
#define COLOR_TOOLBAR_BG [UIColor clearColor]
//工具栏边框
#define WIDTH_TOOLBAR_BORDER 1.0
//工具栏边框颜色
#define COLOR_TOOLBAR_BORDER [UIColor grayColor].CGColor


#endif
