//
//  CharKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import "BaseKBBtn.h"

@interface CharKBBtn : BaseKBBtn

@property(nonatomic, strong) UILabel *topLabel;

@property(nonatomic, strong) UILabel *mainLabel;

- (void)setupSubViews;

- (void)setText:(NSString *)text topText:(NSString *)topText;

-(void)setText:(NSString *)text;

-(NSString *)text;

-(NSString *)topText;


@end
