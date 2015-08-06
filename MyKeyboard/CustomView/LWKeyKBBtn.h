//
//  LWKeyKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import "LWBaseKBBtn.h"

@interface LWKeyKBBtn : LWBaseKBBtn

@property(nonatomic, strong) UILabel *mainLabel;

- (void)setupSubViews;

-(void)setText:(NSString *)text;

-(NSString *)text;

@end
