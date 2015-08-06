//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWNumLeftTabView.h"
#import "LWDefines.h"

#define NUM_SYMBOLS @[@"%", @":", @"℃", @"/", @"#", @",", @"_", @"+", @"-", @"*", @"=", @"¥"]

@interface LWNumLeftTabView ()

@end

@implementation LWNumLeftTabView

- (instancetype)initWithCoder:(NSCoder *)coder {
//    Log(@"--------%d:%s：", __LINE__, __func__);
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        self.dataList = NUM_SYMBOLS;

        //构建子视图
        [self setupSubViews];
    }

    return self;
}

/**
* layout 子视图
*/
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL);
    [self.contentView reloadData];
//    //重设置内边框、背景、高亮背景大小
//    _innerGlow.frame = CGRectInset(self.bounds, 1, 1);
    [super layoutSubviews];

}

/**
* 设置子视图
*/
- (void)setupSubViews {

    if (self.contentView) {
        [self.contentView removeFromSuperview];
        self.contentView = nil;
    }

    self.contentView = [[UITableView alloc] initWithFrame:CGRectInset(self.bounds, SPACE_BTN_BG_HORIZON, SPACE_BTN_BG_VERTICAL) style:UITableViewStylePlain];
    self.contentView.dataSource = self;
    self.contentView.delegate = self;
    self.contentView.showsVerticalScrollIndicator = NO;
    self.contentView.tableFooterView = [[UIView alloc] init];
    self.contentView.separatorInset = Cell_SeparatorInset;
    self.contentView.layoutMargins = UIEdgeInsetsZero;
    [self addSubview:self.contentView];

    //设置contentView背景透明
    self.contentView.backgroundColor = [UIColor clearColor];
//    self.contentView.backgroundView.backgroundColor = [UIColor clearColor];

    //给contentView添加内外边框
//    [self setupInnerGlow];
    [self setupBorder];

    //给contentView添加阴影
    [self setupShadowLayer];
}

@end
