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

@property(nonatomic, strong) UILabel *tipLb;

/**
* 设置子视图
*/
- (void)setupSubViews;


- (void)setupTip:(NSString *)tip;
@end

