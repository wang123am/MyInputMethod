//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWCharKBBtn.h"


@interface LWFullCharBtn : LWCharKBBtn

//上标签
@property(nonatomic, strong) UILabel *topLabel;

//主标签
@property(nonatomic, strong) UILabel *mainLabel;

/**
* 设置子视图
*/
- (void)setupSubViews;

/**
* 给按键主标签与上标签字符内容
*/
- (void)setTopText:(NSString *)upText text:(NSString *)text;

/**
* 给按键主标签设置内容,并移除上标签内容
*/
-(void)setText:(NSString *)text ;

/**
* 获得按键主标签内容
*/
-(NSString *)text;

/**
* 获得按键上标签内容
*/
-(NSString *)topText;

@end
