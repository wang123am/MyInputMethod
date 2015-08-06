//
//  MyKeyboardViewController.m
//  MyKeyboard
//
//  Created by luowei on 15/6/30.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "MyKeyboardViewController.h"
#import "LWPinYinFullKeyboard.h"


@interface MyKeyboardViewController ()
@property(nonatomic, strong) UIButton *nextKeyboardButton;
@end

@implementation MyKeyboardViewController

- (void)updateViewConstraints {
    Log(@"--------%d:%s：", __LINE__, __func__);
    [super updateViewConstraints];

    // Add custom view sizing constraints here
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat inputHeight = (CGFloat) (screenSize.width > screenSize.height ? KEYBOARD_LANDSCAPE_HEIGHT : KEYBOARD_HEIGHT);
    _inputViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.inputView
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1
                                                               constant:inputHeight];


    _keyboardHorizonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[keyboard]|" options:0 metrics:nil views:@{@"keyboard" : _keyboard}];
    _keyboardVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[keyboard]|" options:0 metrics:nil views:@{@"keyboard" : _keyboard}];

    [NSLayoutConstraint activateConstraints:@[_inputViewHeightConstraint]];
    [NSLayoutConstraint activateConstraints:_keyboardHorizonConstraints];
    [NSLayoutConstraint activateConstraints:_keyboardVerticalConstraints];
}

- (void)viewDidLayoutSubviews {
    Log(@"--------%d:%s：", __LINE__, __func__);
    [super viewDidLayoutSubviews];

    [_keyboard layoutSubviews];
}


- (void)viewDidLoad {
    Log(@"--------%d:%s：", __LINE__, __func__);
    [super viewDidLoad];

    if (!self.keyboard) {
        //26键盘
        _keyboard = (LWPinYinFullKeyboard *) [[NSBundle mainBundle] loadNibNamed:@"LWPinYinFullKeyboard" owner:self.view options:nil][0];
//        [_keyboard setupBackground:[UIImage imageNamed:@"keyboardBG"]];
        [_keyboard setupKeyboard:KBKeyboard_PingYingFull];

    }
    [self.inputView addSubview:_keyboard];
    _keyboard.translatesAutoresizingMaskIntoConstraints = NO;

}

- (void)viewWillAppear:(BOOL)animated {
    Log(@"--------%d:%s：", __LINE__, __func__);
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    Log(@"--------%d:%s：", __LINE__, __func__);
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}


#pragma mark UITextInputDelegate Implamentation

- (void)textWillChange:(id <UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id <UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
