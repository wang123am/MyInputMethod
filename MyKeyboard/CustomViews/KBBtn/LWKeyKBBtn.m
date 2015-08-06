//
//  LWKeyKBBtn.m
//  MyInputMethod
//
//  Created by luowei on 15/7/1.
//  Copyright (c) 2015 luowei. All rights reserved.
//

#import "LWKeyKBBtn.h"
#import "LWDefines.h"

@implementation LWKeyKBBtn {
    NSString *mainText;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubViews];
    }

    return self;
}

/**
* 设置子视图
*/
- (void)setupSubViews {
    [super setupSubViews];

    //    [self setText:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [_mainLabel sizeToFit];

    //subView的中心点位置根据boundSize来设置
    CGSize boundSize = self.contentView.bounds.size;
    CGSize mainLbSize = _mainLabel.bounds.size;
    _mainLabel.frame = CGRectMake((boundSize.width - mainLbSize.width) / 2, boundSize.height / 8 + (boundSize.height * 3 / 4 - mainLbSize.height) / 2, mainLbSize.width, mainLbSize.height);

//    [super layoutSubviews];
}

/**
* 设置主标签内容
*/
- (void)setText:(NSString *)text {
    if (text) {
        if (!_mainLabel) {
            CGSize boundSize = self.contentView.bounds.size;
            _mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, boundSize.height / 8, boundSize.width, boundSize.height * 3 / 4)];
            _mainLabel.textAlignment = NSTextAlignmentCenter;
            _mainLabel.font = MAINTEXT_FONT;
            [self.contentView addSubview:_mainLabel];
        }
        _mainLabel.text = text;
    } else {
        [_mainLabel removeFromSuperview];
        _mainLabel = nil;
    }
    mainText = text;
}

/**
* 获得主标签内容
*/
- (NSString *)text {
    return _mainLabel ? _mainLabel.text : mainText;
}


@end


@implementation LWNextBtn : LWKeyKBBtn
@end

@implementation LWDeleteBtn : LWKeyKBBtn
@end

@implementation LWShiftBtn : LWKeyKBBtn
@end

@implementation LWZhEnBtn : LWKeyKBBtn
@end

@implementation LWBackBtn : LWKeyKBBtn
@end

@implementation LWEnZhBtn : LWKeyKBBtn
@end

@implementation LWSymbolKeyBtn : LWKeyKBBtn
@end

@implementation LWNumKeyBtn : LWKeyKBBtn
@end

@implementation LWBreaklineBtn : LWKeyKBBtn
@end

