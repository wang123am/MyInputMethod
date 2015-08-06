//
//  LWBaseKBBtn.h
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWBaseKBBtn : UIButton

@property(nonatomic, strong) UIView *contentView;

@property(nonatomic, strong) NSNumber *dicTag;

//背景图层
@property(nonatomic, strong) CALayer *backgroundLayer;

//高亮背景图层
@property(nonatomic, strong) CALayer *highlightBackgroundLayer;

- (void)setupSubViews;

//按Normal状态时的背景色
- (void)setupBackgroundLayer:(UIImage *)image withGravity:(NSString *)gravity;

//按Highlight状态时的背景色
- (void)setupHighlightBackgroundLayer:(UIImage *)image withGravity:(NSString *)gravity;

@end
