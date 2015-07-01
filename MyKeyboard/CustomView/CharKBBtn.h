//
//  CharKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//



#import "BaseKBBtn.h"

@class KBLabel;

@interface CharKBBtn : BaseKBBtn

@property(nonatomic, strong) KBLabel *topLabel;

@property(nonatomic, strong) KBLabel *mainLabel;

- (void)setImage:(UIImage *)image forState:(UIControlState)state;
@end
