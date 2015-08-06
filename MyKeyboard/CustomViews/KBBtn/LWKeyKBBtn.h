//
//  LWKeyKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//


#import "LWBaseKBBtn.h"

@interface LWKeyKBBtn : LWBaseKBBtn

//主标签
@property(nonatomic, strong) UILabel *mainLabel;

/**
* 设置子视图
*/
- (void)setupSubViews;

/**
* 设置主标签内容
*/
-(void)setText:(NSString *)text;

/**
* 获得主标签内容
*/
-(NSString *)text;

@end



@interface LWNextBtn : LWKeyKBBtn
@end

@interface LWDeleteBtn : LWKeyKBBtn
@end

@interface LWShiftBtn : LWKeyKBBtn
@end

@interface LWZhEnBtn : LWKeyKBBtn
@end

@interface LWBackBtn : LWKeyKBBtn
@end

@interface LWEnZhBtn : LWKeyKBBtn
@end

@interface LWSymbolKeyBtn : LWKeyKBBtn
@end

@interface LWNumKeyBtn : LWKeyKBBtn
@end

@interface LWBreaklineBtn : LWKeyKBBtn
@end
