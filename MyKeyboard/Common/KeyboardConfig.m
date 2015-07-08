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
+ (NSDictionary *)enFullKBCharTextTagDict {
    return @{@"1|q" : @101, @"2|w" : @102, @"3|e" : @103, @"4|r" : @104, @"5|t" : @105, @"6|y" : @106, @"7|u" : @107, @"8|i" : @108, @"9|o" : @109, @"0|p" : @110,
            @"@|a" : @201, @"~|s" : @202, @"?|d" : @203, @"…|f" : @204, @"；|g" : @205, @"：|h" : @206, @"、|j" : @207, @"（|k" : @208, @"）|l" : @209,
            @".|z" : @302, @"！|x" : @303, @"=|c" : @304, @"“|v" : @305, @"”|b" : @306, @"《|n" : @307, @"》|m" : @308, @"image|space,space_highlighted" : @404, @"。|，" : @405};
}

//英文全键功能键text->tag字典
+ (NSDictionary *)enFullKBKeyTextTagDict {
    return @{@"符" : @301, @"image|delete,delete_highlighted" : @309, @"ABC" : @401, @"image|next,next_highlighted" : @402, @"123" : @403, NSLocalizedString(@"BreakLine", nil) : @406};
}

//拼音全键字符键text->tag字典
+ (NSDictionary *)pingYingFullKBCharTextTagDict {
    return @{@"1|Q" : @101, @"2|W" : @102, @"3|E" : @103, @"4|R" : @104, @"5|T" : @105, @"6|Y" : @106, @"7|U" : @107, @"8|I" : @108, @"9|O" : @109, @"0|P" : @110,
            @"@|A" : @201, @"~|S" : @202, @"?|D" : @203, @"…|F" : @204, @"；|G" : @205, @"：|H" : @206, @"、|J" : @207, @"（|K" : @208, @"）|L" : @209,
            @".|Z" : @302, @"！|X" : @303, @"=|C" : @304, @"“|V" : @305, @"”|B" : @306, @"《|N" : @307, @"》|M" : @308, @"image|space,space_highlighted" : @404, @"。|，" : @405};
}

//拼音全键功能键text->tag字典
+ (NSDictionary *)pingYingFullKBKeyTextTagDict {
    return @{@"image|shift,shift_highlighted" : @301, @"image|delete,delete_highlighted" : @309, @"ABC" : @401, @"image|next,next_highlighted" : @402, @"123" : @403, NSLocalizedString(@"BreakLine", nil) : @406};
}

+ (NSDictionary *)fullKBTagImageDic {
    return @{@101 : @"q", @102 : @"w", @103 : @"e", @104 : @"r", @105 : @"t", @106 : @"y", @107 : @"u", @108 : @"i", @109 : @"o", @110 : @"p",
            @201 : @"a", @202 : @"s", @203 : @"d", @204 : @"f", @205 : @"g", @206 : @"h", @207 : @"j", @208 : @"k", @209 : @"l",
            @301 : @"symbol", @302 : @"z", @303 : @"x", @304 : @"c", @305 : @"v", @306 : @"b", @307 : @"n", @308 : @"m", @309 : @"delete",
            @401 : @"ABC", @402 : @"next", @403 : @"123", @404 : @"space", @405 : @",.", @406 : @"return",};
}

//获得当前主题
+ (NSDictionary *)currentTheme {
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MachineTheme" ofType:@"plist"]];
    return dict;
}

//根据当前主题获得按键主题图片
+ (UIImage *)getBtnImagesWithByTag:(NSInteger)tag {

    return nil;
}

//根据当前主题获得按键的内容图片
+ (void)setKBLabImagewithTag:(NSInteger)tag onLayer:(CALayer *)layer {
    NSString *smallName = [KeyboardConfig fullKBTagImageDic][@(tag)];
    NSDictionary *rootDic = [KeyboardConfig currentTheme];

    UIImage *bigImage = [UIImage imageNamed:rootDic[@"meta"][@"image"]];
    CGFloat bigWidth = ((NSNumber *)rootDic[@"meta"][@"width"]).floatValue;
    CGFloat bigHeight = ((NSNumber *)rootDic[@"meta"][@"height"]).floatValue;

    NSDictionary *rectDict = rootDic[@"frames"][smallName];
    CGFloat x = ((NSNumber *)rectDict[@"x"]).floatValue/bigWidth;
    CGFloat y = ((NSNumber *)rectDict[@"y"]).floatValue/bigHeight;
    CGFloat width = ((NSNumber *)rectDict[@"w"]).floatValue/bigWidth;
    CGFloat height = ((NSNumber *)rectDict[@"h"]).floatValue/bigHeight;

    layer.contents = (__bridge id) bigImage.CGImage;
    //scale contents to fit
    layer.contentsGravity = kCAGravityResizeAspectFill;
    layer.contentsScale = bigImage.scale;
    //set contentsRect
    layer.contentsRect = CGRectMake(x, y, width, height);

}


@end