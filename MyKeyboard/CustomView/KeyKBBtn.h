//
//  KeyKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import "BaseKBBtn.h"

@class KBLabel;

@interface KeyKBBtn : BaseKBBtn

@property(nonatomic, strong) KBLabel *mainLabel;

- (void)setupSubViews;

@end
