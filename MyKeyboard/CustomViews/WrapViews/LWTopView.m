//
// Created by luowei on 15/8/4.
// Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWTopView.h"
#import "LWToolBar.h"
#import "LWDefines.h"


@implementation LWTopView {
    CALayer *topBorder;
    CALayer *bottomBorder;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        //添加边框
        topBorder = [CALayer layer];
        topBorder.backgroundColor = COLOR_KBBTN_CONTENTVIEW_BORDER;
        topBorder.frame = CGRectMake(0, 0, self.bounds.size.width, 0.5);
        [self.layer addSublayer:topBorder];

        bottomBorder = [CALayer layer];
        bottomBorder.backgroundColor = COLOR_KBBTN_CONTENTVIEW_BORDER;
        bottomBorder.frame = CGRectMake(0, (CGFloat) (self.bounds.size.height-0.5), self.bounds.size.width, 0.5);
        [self.layer addSublayer:bottomBorder];
    }

    return self;
}

- (void)layoutSubviews {
    topBorder.frame = CGRectMake(0, 0, self.bounds.size.width, 0.5);
    bottomBorder.frame = CGRectMake(0, (CGFloat) (self.bounds.size.height-0.5), self.bounds.size.width, 0.5);
    [super layoutSubviews];
}

- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    if([view isKindOfClass:[LWToolBar class]]){
        LWToolBar *toolBar = (LWToolBar *)view;
        [toolBar setupToolBarConstraints];
    }
}

@end