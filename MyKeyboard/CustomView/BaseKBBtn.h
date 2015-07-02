//
//  BaseKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseKBBtn : UIControl

- (void)setImage:(UIImage *)image forState:(UIControlState)state;

- (void)setupSubViews;

@end
