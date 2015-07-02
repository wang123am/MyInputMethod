//
//  KeyKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import "BaseKBBtn.h"

@interface KeyKBBtn : BaseKBBtn

@property(nonatomic, strong) UILabel *mainLabel;

- (void)setupSubViews;

-(void)setText:(NSString *)text;

-(NSString *)text;

@end
