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

+ (NSString *)currentTheme;

+ (UIImage *)getBtnImagesWithByName:(NSString *)name;

+ (UIImage *)getKBLabImageWithByName:(NSString *)name withText:(NSString *)text;

@end