//
//  BaseKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseKBBtn : UIButton

@property(nonatomic, strong) UIView *contentView;

- (void)setupSubViews;

@end
