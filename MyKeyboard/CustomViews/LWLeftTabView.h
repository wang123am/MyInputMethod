//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LWLeftTabViewDelegate <NSObject>

/**
* 上屏插入字符
*/
- (void)insertText:(NSString *)text;

@end

@interface LWLeftTabView : UIView<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak) id <LWLeftTabViewDelegate> delegate;

@property(nonatomic, strong) UITableView *contentView;

@property(nonatomic, strong) NSArray *dataList;

/**
* 设置dataList数据源
*/
- (void)setupDataList:(NSArray *)dataList;

/**
* 给contentView添加内边框
*/
- (void)setupInnerGlow;

/**
* 给contentView添加外边框
*/
- (void)setupBorder;

/**
* 给contentView添加阴影
*/
- (void)setupShadowLayer;

@end
