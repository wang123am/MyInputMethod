//
//  MyKeyboardViewController.h
//  MyKeyboard
//
//  Created by luowei on 15/6/30.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseKeyboard;


@interface MyKeyboardViewController : UIInputViewController

@property(nonatomic, strong) NSLayoutConstraint *inputViewHeightConstraint;
@property(nonatomic, strong) BaseKeyboard *keyboard;

@property(nonatomic, strong) NSArray *keyboardHorizonConstraints;
@property(nonatomic, strong) NSArray *keyboardVerticalConstraints;
@end
