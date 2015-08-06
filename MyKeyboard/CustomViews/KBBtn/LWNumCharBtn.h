//
//  LWNumKeyBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/8/4.
//  Copyright (c) 2015 luowei. All rights reserved.
//




#import "LWCharKBBtn.h"

@interface LWNumCharBtn : LWCharKBBtn

//主标签
@property(nonatomic, strong) UILabel *mainLabel;

/**
* 设置子视图
*/
- (void)setupSubViews;

/**
* 给按键主标签设置内容,并移除上标签内容
*/
-(void)setText:(NSString *)text ;

/**
* 获得按键主标签内容
*/
-(NSString *)text;

@end


@interface LWNumSymbolCharBtn : LWNumCharBtn

@end
