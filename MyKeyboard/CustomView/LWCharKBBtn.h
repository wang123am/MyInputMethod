//
//  LWCharKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import "LWBaseKBBtn.h"

@interface LWCharKBBtn : LWBaseKBBtn

@property(nonatomic, strong) UILabel *topLabel;

@property(nonatomic, strong) UILabel *mainLabel;

- (void)setupSubViews;

- (void)setTopText:(NSString *)upText text:(NSString *)text;

-(void)setText:(NSString *)text ;

-(NSString *)text;

-(NSString *)topText;


@end
