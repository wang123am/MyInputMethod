//
//  LWKeyboardConfig.m
//  MyInputMethod
//
//  Created by luowei on 15/7/28.
//  Copyright (c) 2015 luowei. All rights reserved.
//


#import "LWKeyboardConfig.h"

@implementation LWKeyboardConfig

//约定:1.按键上下字符内容以 | 分隔,没有分隔默认填充为按键下方字符；2.如果分隔符左边为 image,则设置image；

//英文全键字符键text->tag字典
+ (NSDictionary *)enFullKBCharTextTagDict {
    return @{@"1|q" : @101, @"2|w" : @102, @"3|e" : @103, @"4|r" : @104, @"5|t" : @105, @"6|y" : @106, @"7|u" : @107, @"8|i" : @108, @"9|o" : @109, @"0|p" : @110,
            @".|a" : @201, @"@|s" : @202, @"/|d" : @203, @"$|f" : @204, @"%|g" : @205, @"&|h" : @206, @"*|j" : @207, @"(|k" : @208, @")|l" : @209,
            @"~|z" : @302, @":|x" : @303, @"#|c" : @304, @"-|v" : @305, @"!|b" : @306, @"_|n" : @307, @"?|m" : @308, @"@|." : @403, @"image|space,space_highlighted" : @404};
}

//英文全键功能键text->tag字典
+ (NSDictionary *)enFullKBKeyTextTagDict {
    return @{@"image|shift_normal,shift_selected" : @301, @"image|delete_normal,delete_highlight" : @309, @"123" : @401, @"image|english_btn,english_btn" : @402, @"符" : @405, @"换行" : @406};
}

//拼音全键字符键text->tag字典
+ (NSDictionary *)pinYinFullKBCharTextTagDict {
    return @{@"1|Q" : @101, @"2|W" : @102, @"3|E" : @103, @"4|R" : @104, @"5|T" : @105, @"6|Y" : @106, @"7|U" : @107, @"8|I" : @108, @"9|O" : @109, @"0|P" : @110,
            @"@|A" : @201, @"~|S" : @202, @"?|D" : @203, @"…|F" : @204, @"：|G" : @205, @"；|H" : @206, @"、|J" : @207, @"（|K" : @208, @"）|L" : @209,
            @"。|，" : @301, @".|Z" : @302, @"！|X" : @303, @"=|C" : @304, @"“|V" : @305, @"”|B" : @306, @"《|N" : @307, @"》|M" : @308, @"image|space,space" : @404};
}

//拼音全键功能键text->tag字典
+ (NSDictionary *)pinYinFullKBKeyTextTagDict {
    return @{@"image|delete_normal,delete_highlight" : @309, @"123" : @401, @"image|chinese_btn,chinese_btn" : @402, @"image|next_normal,next_highlight" : @403, @"符" : @405, @"换行" : @406};
}

+(NSDictionary *)pinYinNineKBCharTextTagDict{
    return @{@"1|(●─●)/@":@101,@"2|ABC":@102,@"3|DEF":@103,@"4|GHI":@201,@"5|JKL":@202,@"6|MNO":@203,@"7|PQRS":@301,@"8|TUV":@302,@"9|WXYZ":@303,@"0| ":@404};
}


+(NSDictionary *)pinYinNineKBKeyTextTagDict{
    return @{@"image|delete_normal,delete_highlight":@104,@"重输":@204,@"123":@401,@"image|chinese_btn,chinese_btn":@402,@"image|next_normal,next_highlight":@403,@"符":@405,@"换行":@406};
}

+(NSDictionary *)numNineKBCharTextTagDict{
    return @{@"|1":@101,@"|2":@102,@"|3":@103,@"|4":@201,@"|5":@202,@"|6":@203,@"|@":@204,@"|7":@301,@"|8":@302,@"|9":@303,@"|.":@304,@"image|space,space":@402,@"|0":@403};
}


+(NSDictionary *)numNineKBKeyTextTagDict{
    return @{@"image|delete_normal,delete_highlight":@104,@"返回":@401,@"符":@404,@"换行":@405};
}

/**
* 获得单手模式类型
*/
+ (SingleHandMode)singleHandMode {
    NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:@"SingleHand_Mode"];
    return (SingleHandMode) value;
}

/**
* 获得键盘的皮肤
*/
+ (UIImage *)keyboardSkin {
    //todo:根据用户设置从Document的指定路径读取图片
    return [UIImage imageNamed:@"waterglass.png"];
}

/**
* 候选板类型
*/
+ (PredictiveMode)predictiveMode {
    NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:@"Predictive_Mode"];
    return (PredictiveMode) value;
}

/**
* 当前键盘类型
*/
+ (KeyboardType)currentKeyboardType {
    NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:@"Current_KeyboardType"];
    if(value < 1){
        return Keyboard_PingYingFull;
    }
    return (KeyboardType)value;
}

/**
* 设置当前键盘类型
*/
+ (void)setCurrentKeyboardType:(KeyboardType)type {
    //新类型设置为当前类型
    [[NSUserDefaults standardUserDefaults] setInteger:type forKey:@"Current_KeyboardType"];
}

/**
* 上次键盘类型
*/
+ (KeyboardType)lastKeyboardType {
    NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:@"Last_KeyboardType"];
    if(value < 1){
        return Keyboard_PingYingFull;
    }
    return (KeyboardType) value;
}

/**
* 设置上次键盘类型
*/
+ (void)setLastKeyboardType:(KeyboardType)type{
    //把当前键盘类型设置为上一次类型
    if (type & Keyboard_PingYingFull|| type & Keyboard_ENFull || type & Keyboard_PingYingNine) {
        [[NSUserDefaults standardUserDefaults] setInteger:type forKey:@"Last_KeyboardType"];
    }
}

/**
* 设置上一次中文键盘类型(用于中英切换,防止在英文键盘下切数字、符号键盘后混乱)
*/
+ (void)setLastZhKeyboardType:(KeyboardType)type {
    //把当前键盘类型设置为上一次类型
    if (type & Keyboard_PingYingFull|| type & Keyboard_PingYingNine) {
        [[NSUserDefaults standardUserDefaults] setInteger:type forKey:@"LastZh_KeyboardType"];
    }
}

/**
* 获得上一次中文键盘类型
*/
+ (KeyboardType)lastZhKeyboardType {
    NSInteger value = [[NSUserDefaults standardUserDefaults] integerForKey:@"LastZh_KeyboardType"];
    if(value < 1){
        return Keyboard_PingYingFull;
    }
    return (KeyboardType) value;
}

/**
* 获得常用语数据源
*/
+ (NSArray *)getOftenuseWords {
    //优先从group中读取
    NSUserDefaults *groupDefaults = [[NSUserDefaults alloc] initWithSuiteName:GroupId];
    NSArray *groupWdsList = [groupDefaults objectForKey:Key_OftenuseWords];

    NSUserDefaults *standDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *standWdsList = [standDefaults objectForKey:Key_OftenuseWords];
    if (!standWdsList || standWdsList.count == 0) {
        standWdsList = @[@"Hi!", @"你好!", @"你吃饭了吗？", @"在干嘛呢？", @"最近过的怎么样？",
                @"稍稍等一下!", @"我马上到!", @"我正在开会。", @"不好意思,刚有点事忙去了。"];
    }

    if (groupWdsList && groupWdsList.count > 0 && (![groupWdsList isEqualToArray:standWdsList] || standWdsList)) {
        [standDefaults setObject:groupWdsList forKey:Key_OftenuseWords];
        [standDefaults synchronize];
    } else {
        return standWdsList;
    }

    return groupWdsList;
}

/**
* 获得是否开启完全访问权限
*/
+ (BOOL)isFullAccessGranted {
    //通过获取剪贴板的方式来判断是否开启了权限
    return [UIPasteboard generalPasteboard] != nil;
}
@end
