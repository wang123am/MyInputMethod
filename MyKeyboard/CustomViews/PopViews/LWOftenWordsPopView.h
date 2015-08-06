//
//  LWOftenWordsPopView.h
//  MyInputMethod
//
//  Created by luowei on 15/4/24.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LWOftenusePopViewDelegate <NSObject>


- (void)commitCellSelectedStr:(NSString *)text;
- (void)oftenWordsButtonTouchUpInside;

- (void)addAlertBackgroundViewWithText:(NSString *)text;
@end

@interface LWOftenWordsPopView : UIView

@property(nonatomic, assign) id <LWOftenusePopViewDelegate> delegate;
@property(nonatomic) BOOL isOftenWordsPopViewShowing;

- (void)updateOftenPopView;

@end
