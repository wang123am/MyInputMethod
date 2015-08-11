//
//  Defines.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#ifndef MyInputMethod_Defines____FILEEXTENSION___
#define MyInputMethod_Defines____FILEEXTENSION___

// -------- 常用宏定义

#ifdef DEBUG
#define Log(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define Log(format, ...)
#endif


//Localizable Define
#define NSLocalizedString(key, comment) \
        [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
#define NSLocalizedStringFromTable(key, tbl, comment) \
        [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:(tbl)]
#define NSLocalizedStringFromTableInBundle(key, tbl, bundle, comment) \
        [bundle localizedStringForKey:(key) value:@"" table:(tbl)]
#define NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) \
        [bundle localizedStringForKey:(key) value:(val) table:(tbl)]


// ----------  类型定义
//键盘类型
typedef NS_OPTIONS(NSUInteger, KeyboardType) {
    //常规键盘
    Keyboard_PingYingFull = 1,              //拼音全键
    keyboard_WuBiFull = 1 << 1,             //全键盘五笔
    Keyboard_ENFull = 1 << 2,               //英文全键
    Keyboard_NumNine = 1 << 3,           //数字九键
    Keyboard_PingYingNine = 1 << 4,     //拼音九键
    keyboard_BiHuaNine = 1 << 5,        //笔画九键
    Keyboard_SymbolCollection = 1 << 6,   //符号方键
    Keyboard_SymbolFull = 1 << 7,        //符号全键

    //特定键盘

};

typedef NS_OPTIONS(NSUInteger, PopViewType) {
    PopView_LogoBtn = 1,              //logo设置按键弹窗
    PopView_OftenWordsBtn = 1 << 1,   //常用语弹窗
    PopView_EmojiBtn = 1 << 2,        //Emoji按键弹窗
    PopView_NextBtn = 1 << 3,         //地球键切换键盘弹窗
    PopView_FullCharBtn = 1 << 4,     //全键盘字符按键弹窗
};

//单手模式类型
typedef NS_OPTIONS(NSUInteger, SingleHandMode) {
    SingleHand_LeftMode = 0,    //左手模式,SingleHandView靠右
    SingleHand_RightMode = 1,   //右手模式,SingleHandView靠左
};

//predictive(双行/单行)
typedef NS_OPTIONS(NSUInteger, PredictiveMode) {
    Predictive_DoubleLine = 0,   //双行模式
    Predictive_SingleLine = 1,    //单行模式
};

//换行键类型
typedef NS_ENUM(NSInteger, ReturnKeyType) {
    ReturnKeyDefault,
    ReturnKeyGo,
    ReturnKeyGoogle,
    ReturnKeyJoin,
    ReturnKeyNext,
    ReturnKeyRoute,
    ReturnKeySearch,
    ReturnKeySend,
    ReturnKeyYahoo,
    ReturnKeyDone,
    ReturnKeyEmergencyCall,
    ReturnKeyOk,
};



// --------- 相关key名

#define GroupId [NSBundle mainBundle].infoDictionary[@"GroupId"]


#define Key_KeyboardSoundSetting @"keyboardSoundSetting"
#define Key_FullAccessControl @"fullaccesscontrol"

#define Key_OftenuseWords @"keyboardOftenuseWords"


// ---------  相关参数设置

#define WEAKSELF typeof(self) __weak weakSelf = self;

//屏幕宽度,高度
#define Screen_W ((CGFloat)([UIScreen mainScreen].bounds.size.width))
#define Screen_H ((CGFloat)([UIScreen mainScreen].bounds.size.height))
//竖屏时的屏幕宽度
#define Screen_Protrait_W (Screen_W > Screen_H ? Screen_H : Screen_W)

//InputView横屏、竖屏高度
#define Input_Landscape_H (Screen_Protrait_W == 320.0 ? 202 : 220.0)
#define Input_Protrait_H  (Screen_Protrait_W == 414.0 ? 266.0 : 256.0)
//InputView的高度
#define Input_H ((CGFloat)(Screen_W > Screen_H ? Input_Landscape_H : Input_Protrait_H))

//单手模式下的键盘宽度
#define SINGLEHAND_KEYBOARD_W 320.0


//topView的高度
#define TopView_H  ((CGFloat) ([LWKeyboardConfig predictiveMode] == Predictive_DoubleLine ? 60.0 : 40.0))
//键盘工具栏高度
#define Toolbar_H 40.0
#define Toolbar_Y ((CGFloat) ([LWKeyboardConfig predictiveMode] == Predictive_DoubleLine ? 20.0 : 0.0))



//按键的background横向与纵向的半倍间隙
#define SPACE_BTN_BG_HORIZON 3.0
#define SPACE_BTN_BG_VERTICAL 5.0

//按键外边框圆角半径、宽度、颜色
#define RADIUS_KBBTN_CONTENTVIEW 5.0
#define WIDTH_KBBTN_CONTENTVIEW_BORDER 1.0
#define COLOR_KBBTN_CONTENTVIEW_BORDER [UIColor grayColor].CGColor

//按键内边框宽度及颜色
#define RADIUS_KBBTN_CONTENTVIEW_INNERBORDER 4.0
#define WIDTH_KBBTN_CONTENTVIEW_INNERBORDER 1.0
#define COLOR_KBBTN_CONTENTVIEW_INNERBORDER [UIColor whiteColor].CGColor

//按键背景色
#define COLOR_KBBTN_CONTENTVIEW_BG [UIColor whiteColor].CGColor
//按键背景色不透明度
#define OPACITY_KBBTN_CONTENTVIEW_BG 0.2
#define OPACITY_KBBTN_CONTENTVIEW_BG_HIGHLIGHT 0.5

//按键图片内容的颜色
#define COLOR_KBBTN_IMG_NORMAL [UIColor colorWithRed:1 green:0.93 blue:0.78 alpha:1]
#define COLOR_KBBTN_IMG_HIGHLIGHT [UIColor whiteColor]

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

//字体颜色
#define COLOR_MAINTEXT [UIColor colorWithRed:1 green:0.93 blue:0.78 alpha:1]
#define COLOR_TOPTEXT [UIColor colorWithRed:1 green:0.93 blue:0.78 alpha:1]

//按键中topLb与mainLb的间距
#define SPACE_TOP_MAIN 0.5

//键盘left table 的 Cell 参数
#define Cell_Height 40.0
#define Cell_SeparatorInset UIEdgeInsetsMake(0, 5, 0, 5)


#define Color_AddOften_Text [UIColor colorWithRed:0.04 green:0.49 blue:1 alpha:1]
#define Color_AddOften_BG [UIColor colorWithHexValue:@"#f5f6f7"]

#endif
