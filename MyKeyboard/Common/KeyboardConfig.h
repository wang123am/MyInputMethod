//
// Created by luowei on 15/7/1.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KeyboardConfig : NSObject

//英文全键字符键text->tag字典
+(NSDictionary *)enFullKBCharTextTagDict;

//英文全键功能键text->tag字典
+(NSDictionary *)enFullKBKeyTextTagDict;

//拼音全键字符键text->tag字典
+(NSDictionary *)pingYingFullKBCharTextTagDict;

//拼音全键功能键text->tag字典
+(NSDictionary *)pingYingFullKBKeyTextTagDict;

//按键Tag -> small image name 字典
+ (NSDictionary *)fullKBTagImageDic;

+ (NSDictionary *)currentTheme;

+ (UIImage *)getBtnImagesWithByTag:(NSInteger)tag;

+ (void)setKBLabImagewithTag:(NSInteger)tag onLayer:(CALayer *)layer ;

@end