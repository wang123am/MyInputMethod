//
// Created by luowei on 15/7/1.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "KeyboardConfig.h"


@implementation KeyboardConfig {

}

//约定:1.按键上下字符内容以 | 分隔,没有分隔默认填充为按键下方字符；2.如果分隔符左边为 image,则设置image；
//shift: ⇧⇪ next:🌐 delete:⌫

//英文全键字符键text->tag字典
+(NSDictionary *)enFullKBCharTextTagDict{
    return @{@"1|q" : @101, @"2|w" : @102, @"3|e" : @103, @"4|r" : @104, @"5|t" : @105, @"6|y" : @106, @"7|u" : @107, @"8|i" : @108, @"9|o" : @109, @"0|p" : @110,
            @"@|a" : @201, @"~|s" : @202, @"?|d" : @203, @"…|f" : @204, @"；|g" : @205, @"：|h" : @206, @"、|j" : @207, @"（|k" : @208, @"）|l" : @209,
            @".|z" : @302, @"！|x" : @303, @"=|c" : @304, @"“|v" : @305, @"”|b" : @306, @"《|n" : @307, @"》|m" : @308, @"image|space,space_highlighted" : @404, @"。|，" : @405};
}

//英文全键功能键text->tag字典
+(NSDictionary *)enFullKBKeyTextTagDict{
    return @{@"符" : @301, @"image|delete,delete_highlighted" : @309, @"ABC" : @401, @"image|next,next_highlighted" : @402, @"123":@403, NSLocalizedString(@"BreakLine", nil) : @406};
}

//拼音全键字符键text->tag字典
+(NSDictionary *)pingYingFullKBCharTextTagDict{
    return @{@"1|Q" : @101, @"2|W" : @102, @"3|E" : @103, @"4|R" : @104, @"5|T" : @105, @"6|Y" : @106, @"7|U" : @107, @"8|I" : @108, @"9|O" : @109, @"0|P" : @110,
            @"@|A" : @201, @"~|S" : @202, @"?|D" : @203, @"…|F" : @204, @"；|G" : @205, @"：|H" : @206, @"、|J" : @207, @"（|K" : @208, @"）|L" : @209,
            @".|Z" : @302, @"！|X" : @303, @"=|C" : @304, @"“|V" : @305, @"”|B" : @306, @"《|N" : @307, @"》|M" : @308, @"image|space,space_highlighted" : @404, @"。|，" : @405};
}

//拼音全键功能键text->tag字典
+(NSDictionary *)pingYingFullKBKeyTextTagDict {
    return @{@"image|shift,shift_highlighted" : @301, @"image|delete,delete_highlighted" : @309, @"ABC" : @401, @"image|next,next_highlighted" : @402, @"123":@403, NSLocalizedString(@"BreakLine", nil) : @406};
}


//获得当前主题
+ (NSString *)currentTheme {
    return nil;
}

//根据当前主题获得按键主题图片
+ (UIImage *)getBtnImagesWithByName:(NSString *)name {
    return nil;
}

//根据当前主题获得按键的内容图片
+ (UIImage *)getKBLabImageWithByName:(NSString *)name withText:(NSString *)text {

    //如果text是nil,返回一张默认图
    if(!text){

    }

    return nil;
}


@end